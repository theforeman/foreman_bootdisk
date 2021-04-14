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
    extend Foreman::HTTPProxy

    def self.generate_full_host(host, opts = {}, &block)
      raise Foreman::Exception.new(N_('Host is not in build mode, so the template cannot be rendered')) unless host.build?

      isolinux_template = render_template(host, :PXELinux, ForemanBootdisk::Scope::FullHostBootdisk)
      grub_template = render_template(host, :PXEGrub2, ForemanBootdisk::Scope::FullHostBootdiskEfi)

      # pxe_files and filename conversion is utterly bizarre
      # aim to convert filenames to something usable under ISO 9660, to match as rendered in the template
      # and then still ensure that the fetch() process stores them under the same name
      files = host.operatingsystem.family.constantize::PXEFILES.keys.each_with_object({}) do |type, hash|
        filename = host.operatingsystem.bootfile(host.medium_provider, type)
        iso_filename = iso9660_filename(filename)
        hash[iso_filename] = host.url_for_boot(type)
      end

      generate(opts.merge(isolinux: isolinux_template, grub: grub_template, files: files), &block)
    rescue ::Foreman::Exception => e
      if e.code == 'ERF42-0067'
        ForemanBootdisk.logger.warn e
      else
        raise e
      end
    end

    def self.render_template(host, kind, scope_class)
      template = host.provisioning_template(kind: kind)

      raise Foreman::Exception.new(N_('Unable to generate disk template, %{kind} template not found.'), kind: kind) unless template

      template = ForemanBootdisk::Renderer.new.render_template(
        template: template,
        host: host,
        scope_class: scope_class
      )

      unless template
        err = host.errors.full_messages.to_sentence
        raise Foreman::Exception.new(N_('Unable to generate disk %{kind} template: %{error}'), kind: kind, error: err)
      end

      template
    end

    def self.system_or_exception(command, error)
      unless system(command)
        ForemanBootdisk.logger.debug "Bootdisk command failed: #{command}"
        raise Foreman::Exception.new(N_(error))
      end
    end

    def self.generate(opts = {})
      # isolinux template not provided for generic BIOS bootdisks
      if opts[:isolinux].nil? && opts[:ipxe]
        opts[:isolinux] = <<~EOT
          default ipxe
          label ipxe
          kernel /ipxe
          initrd /script
        EOT
      end

      if opts[:grub].nil? && opts[:ipxe]
        opts[:grub] = <<~EOT
          echo "Grub2 template not associated and/or unsupported bootdisk type."
          echo "The following bootdisks are supported for EFI systems:"
          echo " * FULL HOST BOOTDISK"
          echo " * SUBNET GENERIC BOOTDISK"
          echo "The system will poweroff in few minutes..."
          sleep 500
          poweroff
        EOT
      end

      # And create new temporary directory:
      wd = Dir.mktmpdir('bootdisk-iso-', Rails.root.join('tmp'))
      Dir.mkdir(File.join(wd, 'build'))

      if opts[:isolinux]
        isolinux_source_file = File.join(Setting[:bootdisk_isolinux_dir], 'isolinux.bin')
        raise Foreman::Exception.new(N_('Please ensure the isolinux/syslinux package(s) are installed.')) unless File.exist?(isolinux_source_file)

        FileUtils.cp(isolinux_source_file, File.join(wd, 'build', 'isolinux.bin'))

        source_files = ['ldlinux.c32', 'menu.c32', 'libutil.c32']
        source_files.each do |source_file|
          full_path = File.join(Setting[:bootdisk_syslinux_dir], source_file)
          FileUtils.cp(full_path, File.join(wd, 'build', source_file)) if File.exist?(full_path)
        end

        File.open(File.join(wd, 'build', 'isolinux.cfg'), 'w') do |file|
          file.write(opts[:isolinux])
        end
      end

      if opts[:ipxe]
        ipxe_source_file = File.join(Setting[:bootdisk_ipxe_dir], 'ipxe.lkrn')
        raise Foreman::Exception.new(N_('Please ensure the ipxe-bootimgs package is installed.')) unless File.exist?(ipxe_source_file)

        FileUtils.cp(ipxe_source_file, File.join(wd, 'build', 'ipxe'))
        File.open(File.join(wd, 'build', 'script'), 'w') { |file| file.write(opts[:ipxe]) }
      end

      if opts[:grub]
        FileUtils.mkdir_p(File.join(wd, 'build', 'EFI', 'BOOT'))
        # a copy when using CDROM directly
        File.open(File.join(wd, 'build', 'EFI', 'BOOT', 'grub.cfg'), 'w') { |file| file.write(opts[:grub]) }
        # a copy when using USB/HDD (copied into EFI image as well)
        File.open(File.join(wd, 'build', 'grub-hdd.cfg'), 'w') do |f|
          # set root to (cd0) or similar when booting via disk
          f.write("search --file /ISOLINUX.BIN --set root\n")
          f.write(opts[:grub])
        end
        efibootimg = File.join(wd, 'build', 'efiboot.img')
        system_or_exception("truncate -s 4M #{efibootimg}", N_('Creating new image failed, install truncate utility'))
        system_or_exception("mkfs.msdos #{efibootimg}", N_('Failed to format the ESP image via mkfs.msdos'))
        system_or_exception("mmd -i #{efibootimg} '::/EFI'", N_('Failed to create a directory within the ESP image'))
        system_or_exception("mmd -i #{efibootimg} '::/EFI/BOOT'", N_('Failed to create a directory within the ESP image'))
        {
          File.join(wd, 'build', 'grub-hdd.cfg').to_s => 'GRUB.CFG',
          File.join(Setting[:bootdisk_grub2_dir], 'grubx64.efi').to_s => 'GRUBX64.EFI',
          File.join(Setting[:bootdisk_grub2_dir], 'shimx64.efi').to_s => 'BOOTX64.EFI',
        }.each do |src, dest|
          raise(Foreman::Exception.new(N_('Ensure %{file} is readable (or update "Grub2 directory" setting)'), file: src)) unless File.exist?(src)
          raise(Foreman::Exception.new(N_('Unable to mcopy %{file}'), file: src)) unless system("mcopy -m -i #{efibootimg} '#{src}' '#{"::/EFI/BOOT/#{dest}"}'")
        end
        mkiso_args = "-eltorito-alt-boot -e efiboot.img -no-emul-boot"
        isohybrod_args = ["--uefi"]
      else
        mkiso_args = ''
        isohybrod_args = []
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
      raise Foreman::Exception.new(N_('ISO build failed')) unless system(build_mkiso_command(output_file: iso, extra_commands: mkiso_args, source_directory: File.join(wd, 'build')))

      # Make the ISO bootable as a HDD/USB disk too
      raise Foreman::Exception.new(N_('ISO hybrid conversion failed: %s'), $?) unless system(*["isohybrid", isohybrod_args, iso].flatten.compact)

      yield iso
    ensure
      # Clean the working directory (not the ISO file itself)
      FileUtils.rm_f(File.join(wd, 'build'))
      # Temporary directory cannot be cleaned in-process due to asynchronous send_file call.
      # Also we cannot rely on systemd-tmpfiles-clean as private temporary files are not subject
      # of scheduled cleanups. Let's clean bootdisks from prevous requests manually by finding
      # and deleting all directories created 30 minutes ago.
      delete_older_than = Time.now.to_i - (60 * 30)
      Rails.root.glob('tmp/bootdisk-iso-*').select { |f| File.ctime(f) < delete_older_than }.each { |f| FileUtils.rm_f(f) }
    end

    def self.build_mkiso_command(output_file:, source_directory:, extra_commands:)
      arguments = [
        "-o #{output_file}",
        '-iso-level 2',
        '-b isolinux.bin',
        '-c boot.cat',
        '-no-emul-boot',
        '-boot-load-size 4',
        '-boot-info-table'
      ]
      arguments.push(extra_commands) unless extra_commands.nil?
      [Setting[:bootdisk_mkiso_command], arguments, source_directory].flatten.join(' ')
    end

    def self.token_expiry(host)
      expiry = host.token.try(:expires)
      return '' if Setting[:token_duration].zero? || expiry.blank?

      '_' + expiry.strftime('%Y%m%d_%H%M')
    end

    def self.fetch(path, uri, limit = 10)
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

          if proxy_http_request?(nil, uri.host, uri.scheme)
            proxy_uri = URI.parse(http_proxy)
            http_object = Net::HTTP::Proxy(proxy_uri.host, proxy_uri.port, proxy_uri.user, proxy_uri.password)
          else
            http_object = Net::HTTP
          end
          http_object.start(uri.host, uri.port) do |http|
            request = Net::HTTP::Get.new(uri.request_uri, 'Accept-Encoding' => 'plain')

            http.request(request) do |response|
              case response
              when Net::HTTPSuccess then
                response.read_body do |chunk|
                  file.write chunk
                end
              when Net::HTTPRedirection then
                raise("Too many HTTP redirects when downloading #{uri}") if limit <= 0

                fetch(path, response['location'], limit - 1)
                # prevent multiple writes to the cache
                write_cache = false
              else
                raise ::Foreman::Exception, N_(format("Unable to download boot file %{uri}, HTTP return code %{code}", uri: uri, code: response.code))
              end
            end
          end
        end
      end

      return unless write_cache

      contents = File.read(path)
      return if contents.empty?

      ForemanBootdisk.logger.debug("Caching contents of #{uri}")
      Rails.cache.write(uri, contents, raw: true)
    end

    # isolinux supports up to ISO 9660 level 2 filenames
    def self.iso9660_filename(name)
      dir  = File.dirname(name)
      file = File.basename(name).upcase.tr_s('^A-Z0-9_', '_').last(28)
      dir == '.' ? file : File.join(dir.upcase.tr_s('^A-Z0-9_', '_').last(28), file)
    end
  end
end
