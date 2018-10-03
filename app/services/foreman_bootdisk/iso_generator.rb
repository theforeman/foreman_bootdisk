require 'net/http'
require 'tempfile'
require 'tmpdir'
require 'uri'

# Generates an iPXE ISO hybrid image
#
# requires syslinux, ipxe/ipxe-bootimgs, genisoimage, isohybrid
class ForemanBootdisk::ISOGenerator
  def self.generate_full_host(host, opts = {}, &block)
    raise ::Foreman::Exception.new(N_('Host is not in build mode, so the template cannot be rendered')) unless host.build?

    tmpl = render_pxelinux_template(host)

    # pxe_files and filename conversion is utterly bizarre
    # aim to convert filenames to something usable under ISO 9660, to match as rendered in the template
    # and then still ensure that the fetch() process stores them under the same name
    files = host.operatingsystem.family.constantize::PXEFILES.keys.each_with_object({}) do |type, hash|
      filename = host.operatingsystem.bootfile(host.medium_provider, type)
      iso_filename = iso9660_filename(filename)
      hash[iso_filename] = host.url_for_boot(type)
    end

    generate(opts.merge(:isolinux => tmpl, :files => files), &block)
  end

  def self.render_pxelinux_template(host)
    pxelinux_template = host.provisioning_template(kind: :PXELinux)

    unless pxelinux_template
      raise ::Foreman::Exception.new(N_('Unable to generate disk template, PXELinux template not found.'))
    end

    template = ForemanBootdisk::Renderer.new.render_template(
      template: pxelinux_template,
      host: host,
      scope_class: ForemanBootdisk::Scope::FullHostBootdisk
    )

    unless template
      err = host.errors.full_messages.to_sentence
      raise ::Foreman::Exception.new(N_('Unable to generate disk PXELinux template: %s'), err)
    end

    template
  end

  def self.generate(opts = {}, &block)
    opts[:isolinux] = <<-EOS if opts[:isolinux].nil? && opts[:ipxe]
      default ipxe
      label ipxe
      kernel /ipxe
      initrd /script
    EOS

    Dir.mktmpdir('bootdisk') do |wd|
      Dir.mkdir(File.join(wd, 'build'))

      if opts[:isolinux]
        unless File.exists?(File.join(Setting[:bootdisk_isolinux_dir], 'isolinux.bin'))
          raise ::Foreman::Exception.new(N_("Please ensure the isolinux/syslinux package(s) are installed."))
        end
        FileUtils.cp(File.join(Setting[:bootdisk_isolinux_dir], 'isolinux.bin'), File.join(wd, 'build', 'isolinux.bin'))
        if File.exist?(File.join(Setting[:bootdisk_syslinux_dir], 'ldlinux.c32'))
          FileUtils.cp(File.join(Setting[:bootdisk_syslinux_dir], 'ldlinux.c32'), File.join(wd, 'build', 'ldlinux.c32'))
        end
        File.open(File.join(wd, 'build', 'isolinux.cfg'), 'w') do |file|
          file.write(opts[:isolinux])
        end
      end

      if opts[:ipxe]
        unless File.exists?(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.lkrn'))
          raise ::Foreman::Exception.new(N_("Please ensure the ipxe-bootimgs package is installed."))
        end
        FileUtils.cp(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.lkrn'), File.join(wd, 'build', 'ipxe'))
        File.open(File.join(wd, 'build', 'script'), 'w') { |file| file.write(opts[:ipxe]) }
      end

      if opts[:files]
        opts[:files].each do |file, source|
          fetch(File.join(wd, 'build', file), source)
        end if opts[:files].respond_to? :each
      end

      iso = if opts[:dir]
              Tempfile.new(['bootdisk', '.iso'], opts[:dir]).path
            else
              File.join(wd, 'output.iso')
            end
      unless system("#{Setting[:bootdisk_mkiso_command]} -o #{iso} -iso-level 2 -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table #{File.join(wd, 'build')}")
        raise ::Foreman::Exception.new(N_("ISO build failed"))
      end

      # Make the ISO bootable as a HDD/USB disk too
      unless system("isohybrid", iso)
        raise ::Foreman::Exception.new(N_("ISO hybrid conversion failed"))
      end

      yield iso
    end
  end

  def self.token_expiry(host)
    expiry = host.token.try(:expires)
    return '' if Setting[:token_duration] == 0 || expiry.blank?
    '_' + expiry.strftime('%Y%m%d_%H%M')
  end

  private

  def self.fetch(path, uri)
    dir = File.dirname(path)
    FileUtils.mkdir_p(dir) unless File.exist?(dir)

    use_cache = !!Setting[:bootdisk_cache_media]
    write_cache = false
    File.open(path, 'w') do |file|
      file.binmode

      if use_cache && !(contents = Rails.cache.fetch(uri, :raw => true)).nil?
        ForemanBootdisk.logger.info("Retrieved #{uri} from local cache (use foreman-rake tmp:cache:clear to empty)")
        file.write(contents)
      else
        ForemanBootdisk.logger.info("Fetching #{uri}")
        write_cache = use_cache
        uri = URI(uri)
        Net::HTTP.start(uri.host, uri.port) do |http|
          request = Net::HTTP::Get.new uri.request_uri

          http.request request do |response|
            response.read_body do |chunk|
              file.write chunk
            end
          end
        end
      end
    end

    if write_cache
      ForemanBootdisk.logger.debug("Caching contents of #{uri}")
      Rails.cache.write(uri, File.read(path), :raw => true)
    end
  end

  # isolinux supports up to ISO 9660 level 2 filenames
  def self.iso9660_filename(name)
    dir  = File.dirname(name)
    file = File.basename(name).upcase.tr_s('^A-Z0-9_', '_').last(28)
    dir == '.' ? file : File.join(dir.upcase.tr_s('^A-Z0-9_', '_').last(28), file)
  end
end
