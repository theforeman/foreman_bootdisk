# frozen_string_literal: true

require 'tmpdir'

module ForemanBootdisk
  module Orchestration
    module Compute
      extend ActiveSupport::Concern

      included do
        after_validation :queue_bootdisk_compute
      end

      def bootdisk_isodir
        @bootdisk_isodir ||= Dir.mktmpdir
      end

      def bootdisk_isofile
        File.join(bootdisk_isodir, "#{name}.iso")
      end

      def queue_bootdisk_compute
        return unless compute? && errors.empty?
        return unless provision_method == 'bootdisk'

        # We want to add our queue jobs only if really necessary:
        #   - in case of starting to create a new host
        #   - in case of a rebuild
        if (old.nil? || !old.build?) && build?
          queue.create(name: _('Generating ISO image for %s') % self, priority: 5,
                       action: [self, :setGenerateIsoImage])
          queue.create(name: _('Upload ISO image to datastore for %s') % self, priority: 6,
                       action: [self, :setIsoImage])
          queue.create(name: _('Attach ISO image to CDROM drive for %s') % self, priority: 1001,
                       action: [self, :setAttachIsoImage])
        # Detach ISO image when host sends 'built' HTTP POST request
        elsif old&.build? && !build?
          queue.create(name: _('Detach ISO image from CDROM drive for %s') % self, priority: 52,
                       action: [self, :setDetachIsoImage])
        end
        true
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

      def bootdisk_detach_iso
        compute_resource.iso_detach(uuid)
      end

      def setGenerateIsoImage
        logger.info format('Generating ISO image for %s', name)
        bootdisk_generate_iso_image
      rescue StandardError => e
        failure format(_('Failed to generate ISO image for instance %{name}: %{message}'), name: name, message: e.message), e
      end

      def delGenerateIsoImage; end

      def setIsoImage
        logger.info "Uploading ISO image #{bootdisk_isofile} for #{name}"
        bootdisk_upload_iso
      rescue StandardError => e
        failure format(_('Failed to upload ISO image for instance %{name}: %{message}'), name: name, message: e.message), e
      end

      def delIsoImage; end

      def setAttachIsoImage
        logger.info format('Attaching ISO image to CDROM drive for %s', name)
        bootdisk_attach_iso
      rescue StandardError => e
        failure format(_('Failed to attach ISO image to CDROM drive of instance %{name}: %{message}'), name: name, message: e.message), e
      end

      def delAttachIsoImage; end

      def setDetachIsoImage
        logger.info format('Detaching ISO image from CDROM drive for %s', name)
        bootdisk_detach_iso
      rescue StandardError => e
        failure format(_('Failed to detach ISO image from CDROM drive of instance %{name}: %{message}'), name: name, message: e.message), e
      end

      def delDetachIsoImage; end
    end
  end
end
