require 'tmpdir'

module ForemanBootdisk
  module Orchestration
    module Compute
      extend ActiveSupport::Concern

      included do
        after_validation :queue_bootdisk_compute
        after_build :rebuild_with_bootdisk
      end

      def bootdisk_isodir
        @bootdisk_isodir ||= Dir.mktmpdir
      end

      def bootdisk_isofile
        File.join(bootdisk_isodir, "#{name}.iso")
      end

      def queue_bootdisk_compute
        return unless compute? && errors.empty? && new_record?
        return unless provision_method == 'bootdisk'
        queue.create(name: _('Generating ISO image for %s') % self, priority: 5,
                     action: [self, :setGenerateIsoImage])
        queue.create(name: _('Upload ISO image to datastore for %s') % self, priority: 6,
                     action: [self, :setIsoImage])
        queue.create(name: _('Attach ISO image to CDROM drive for %s') % self, priority: 1001,
                     action: [self, :setAttachIsoImage])
      end

      def bootdisk_generate_iso_image
        ForemanBootdisk::ISOGenerator.generate(ipxe: bootdisk_template_render, dir: Dir.tmpdir) do |image|
          FileUtils.mv image, bootdisk_isofile
        end
      end

      def bootdisk_upload_iso
        compute_resource.iso_upload(bootdisk_isofile, uuid)
      end

      def bootdisk_attach_iso
        compute_resource.iso_attach(File.basename(bootdisk_isofile), uuid)
      end

      def setGenerateIsoImage
        logger.info 'Generating ISO image for %s' % name
        bootdisk_generate_iso_image
      rescue => e
        failure _('Failed to generate ISO image for instance %{name}: %{message}') % { name: name, message: e.message }, e
      end

      def delGenerateIsoImage; end

      def setIsoImage
        logger.info "Uploading ISO image #{bootdisk_isofile} for #{name}"
        bootdisk_upload_iso
      rescue => e
        failure _('Failed to upload ISO image for instance %{name}: %{message}') % { name: name, message: e.message }, e
      end

      def delIsoImage; end

      def setAttachIsoImage
        logger.info 'Attaching ISO image to CDROM drive for %s' % name
        bootdisk_attach_iso
      rescue => e
        failure _('Failed to attach ISO image to CDROM drive of instance %{name}: %{message}') % { name: name, message: e.message }, e
      end

      def delAttachIsoImage; end

      def rebuild_with_bootdisk
        return true unless bootdisk?
        begin
          bootdisk_generate_iso_image
          bootdisk_upload_iso
          bootdisk_attach_iso
        rescue => e
          Foreman::Logging.exception "Failed to rebuild Bootdisk image for #{name}", e, :level => :error
          return false
        end
      end
    end
  end
end
