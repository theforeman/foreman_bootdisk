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

    pxelinux_template = host.send(:generate_pxe_template, :PXELinux)
    pxegrub2_template = host.send(:generate_pxe_template, :PXEGrub2) if Setting[:bootdisk_efiboot_dir].present?
    unless (pxelinux_template && pxegrub2_template)
      err = host.errors.full_messages.to_sentence
      raise ::Foreman::Exception.new(N_('Unable to generate disk template, PXELinux/Grub2 template not found or: %s'), err)
    end

    # pxe_files and filename conversion is utterly bizarre
    # aim to convert filenames to something usable under ISO 9660, update the template to match
    # and then still ensure that the fetch() process stores them under the same name
    files = host.operatingsystem.pxe_files(host.medium, host.architecture, host)
    files.map! do |bootfile_info|
      bootfile_info.map do |f|
        suffix = f[1].split('/').last
        iso_f0 = iso9660_filename(f[0].to_s + '_' + suffix)
        pxelinux_template.gsub!(f[0].to_s + '-' + suffix, iso_f0)
        pxegrub2_template.gsub!(f[0].to_s + '-' + suffix, '/' + iso_f0) if pxegrub2_template
        ForemanBootdisk.logger.debug("Boot file #{iso_f0}, source #{f[1]}")
        [iso_f0, f[1]]
      end
    end

    generate(opts.merge(:isolinux => pxelinux_template, :grub => pxegrub2_template, :files => files), &block)
  end

  def self.generate(opts = {}, &block)
    opts[:isolinux] = <<-EOS if opts[:isolinux].nil? && opts[:ipxe]
      default ipxe
      label ipxe
      kernel /ipxe
      initrd /script
    EOS

    opts[:grub] = <<-EOS if opts[:grub].nil? && opts[:ipxe]
set default=0
set timeout=5
menuentry "Chainload iPXE chain" {
  search --no-floppy --set=root -f /ipxe.efi
  chainloader ($root)/ipxe.efi
  boot echo HELLO
}
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
        if File.exists?(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.efi'))
          FileUtils.cp(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.efi'), File.join(wd, 'build', 'ipxe.efi'))
        elsif File.exists?(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe-x86_64.efi'))
          FileUtils.cp(File.join(Setting[:bootdisk_ipxe_dir], 'ipxe-x86_64.efi'), File.join(wd, 'build', 'ipxe.efi'))
        else
          raise ::Foreman::Exception.new(N_("Please ensure the iPXE directory contains ipxe.efi."))
        end
        File.open(File.join(wd, 'build', 'script'), 'w') { |file| file.write(opts[:ipxe]) }
      end

      if opts[:files]
        opts[:files].each do |bootfile_info|
          for file, source in bootfile_info do
            fetch(File.join(wd, 'build', file), source)
          end
        end if opts[:files].respond_to? :each
      end

      iso = if opts[:dir]
              Tempfile.new(['bootdisk', '.iso'], opts[:dir]).path
            else
              File.join(wd, 'output.iso')
            end

      if Setting[:bootdisk_efiboot_dir].present?
        FileUtils.mkdir_p(File.join(wd, 'build', 'EFI', 'BOOT'))
        FileUtils.cp(File.join(Setting[:bootdisk_efiboot_dir], 'efiboot.img'), File.join(wd, 'build', 'EFI', 'BOOT', 'efiboot.img'))
        File.open(File.join(wd, 'build', 'EFI', 'BOOT', 'grub.cfg'), 'w') do |file|
          file.write(opts[:grub])
        end
        efiopts = "-eltorito-alt-boot -e EFI/BOOT/efiboot.img -no-emul-boot"
        isohybrid_command = "isohybrid --uefi #{iso}"
      else
        efiopts = ''
        isohybrid_command = "isohybrid #{iso}"
      end

      mkiso_command = "#{Setting[:bootdisk_mkiso_command]} -o #{iso} -iso-level 2 -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table #{efiopts} #{File.join(wd, 'build')}"
      ForemanBootdisk.logger.info("Executing: #{mkiso_command}")
      unless system(mkiso_command)
        raise ::Foreman::Exception.new(N_("ISO build failed") + ': ' + mkiso_command)
      end

      # Make the ISO bootable as a HDD/USB disk too
      ForemanBootdisk.logger.info("Executing: #{isohybrid_command}")
      unless system(isohybrid_command)
        raise ::Foreman::Exception.new(N_("ISO hybrid conversion failed") + ': ' + isohybrid_command)
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
