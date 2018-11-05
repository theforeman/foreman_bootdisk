# frozen_string_literal: true

require 'net/http'
require 'tempfile'
require 'tmpdir'
require 'uri'

# Generates an iPXE ISO hybrid image
#
# requires syslinux, ipxe/ipxe-bootimgs, genisoimage, isohybrid
module ForemanBootdisk
  class ISOGenerator
    def self.generate_full_host(host, opts = {}, &block)
      raise Foreman::Exception, N_('Host is not in build mode, so the template cannot be rendered') unless host.build?

      tmpl = render_pxelinux_template(host)

      # pxe_files and filename conversion is utterly bizarre
      # aim to convert filenames to something usable under ISO 9660, to match as rendered in the template
      # and then still ensure that the fetch() process stores them under the same name
      files = host.operatingsystem.family.constantize::PXEFILES.keys.each_with_object({}) do |type, hash|
        filename = host.operatingsystem.bootfile(host.medium_provider, type)
        iso_filename = iso9660_filename(filename)
        hash[iso_filename] = host.url_for_boot(type)
      end

      generate(opts.merge(isolinux: tmpl, files: files), &block)
    end

    def self.render_pxelinux_template(host)
      pxelinux_template = host.provisioning_template(kind: :PXELinux)

      raise Foreman::Exception, N_('Unable to generate disk template, PXELinux template not found.') unless pxelinux_template

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

    def self.generate(opts = {})
      opts[:isolinux] = <<~ISOLINUX if opts[:isolinux].nil? && opts[:ipxe]
        default ipxe
        label ipxe
        kernel /ipxe
        initrd /script
      ISOLINUX

      Dir.mktmpdir('bootdisk') do |wd|
        Dir.mkdir(File.join(wd, 'build'))

        if opts[:isolinux]
          isolinux_source_file = File.join(Setting[:bootdisk_isolinux_dir], 'isolinux.bin')
          raise Foreman::Exception, N_('Please ensure the isolinux/syslinux package(s) are installed.') unless File.exist?(isolinux_source_file)

          FileUtils.cp(isolinux_source_file, File.join(wd, 'build', 'isolinux.bin'))

          ldlinux_source_file = File.join(Setting[:bootdisk_syslinux_dir], 'ldlinux.c32')
          FileUtils.cp(ldlinux_source_file, File.join(wd, 'build', 'ldlinux.c32')) if File.exist?(ldlinux_source_file)

          File.open(File.join(wd, 'build', 'isolinux.cfg'), 'w') do |file|
            file.write(opts[:isolinux])
          end
        end

        if opts[:ipxe]
          ipxe_source_file = File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.lkrn')
          raise Foreman::Exception, N_('Please ensure the ipxe-bootimgs package is installed.') unless File.exist?(ipxe_source_file)

          FileUtils.cp(ipxe_source_file, File.join(wd, 'build', 'ipxe'))
          File.open(File.join(wd, 'build', 'script'), 'w') { |file| file.write(opts[:ipxe]) }
        end

        if opts[:files]
          if opts[:files].respond_to?(:each)
            opts[:files].each do |file, source|
              fetch(File.join(wd, 'build', file), source)
            end
          end
        end

        iso = if opts[:dir]
                Tempfile.new(['bootdisk', '.iso'], opts[:dir]).path
              else
                File.join(wd, 'output.iso')
              end
        raise Foreman::Exception, N_('ISO build failed') unless system(build_mkiso_command(output_file: iso, source_directory: File.join(wd, 'build')))

        # Make the ISO bootable as a HDD/USB disk too
        raise Foreman::Exception, N_('ISO hybrid conversion failed') unless system('isohybrid', iso)

        yield iso
      end
    end

    def self.build_mkiso_command(output_file:, source_directory:)
      arguments = [
        "-o #{output_file}",
        '-iso-level 2',
        '-b isolinux.bin',
        '-c boot.cat',
        '-no-emul-boot',
        '-boot-load-size 4',
        '-boot-info-table'
      ]
      [Setting[:bootdisk_mkiso_command], arguments, source_directory].flatten.join(' ')
    end

    def self.token_expiry(host)
      expiry = host.token.try(:expires)
      return '' if Setting[:token_duration].zero? || expiry.blank?

      '_' + expiry.strftime('%Y%m%d_%H%M')
    end

    def self.fetch(path, uri)
      dir = File.dirname(path)
      FileUtils.mkdir_p(dir) unless File.exist?(dir)

      use_cache = !!Setting[:bootdisk_cache_media]
      write_cache = false
      File.open(path, 'w') do |file|
        file.binmode

        if use_cache && !(contents = Rails.cache.fetch(uri, raw: true)).nil?
          ForemanBootdisk.logger.info("Retrieved #{uri} from local cache (use foreman-rake tmp:cache:clear to empty)")
          file.write(contents)
        else
          ForemanBootdisk.logger.info("Fetching #{uri}")
          write_cache = use_cache
          uri = URI(uri)
          Net::HTTP.start(uri.host, uri.port) do |http|
            request = Net::HTTP::Get.new(uri.request_uri)

            http.request(request) do |response|
              response.read_body do |chunk|
                file.write chunk
              end
            end
          end
        end
      end

      return unless write_cache

      ForemanBootdisk.logger.debug("Caching contents of #{uri}")
      Rails.cache.write(uri, File.read(path), raw: true)
    end

    # isolinux supports up to ISO 9660 level 2 filenames
    def self.iso9660_filename(name)
      dir  = File.dirname(name)
      file = File.basename(name).upcase.tr_s('^A-Z0-9_', '_').last(28)
      dir == '.' ? file : File.join(dir.upcase.tr_s('^A-Z0-9_', '_').last(28), file)
    end
  end
end
