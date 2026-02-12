# frozen_string_literal: true

module ForemanBootdisk
  module ComputeResources
    module Libvirt
      def capabilities
        super + [:bootdisk]
      end

      def set_boot_order(attr = {})
        order = super(attr)
        order.unshift 'cdrom' if attr[:provision_method] == 'bootdisk'
        order
      end

      def iso_upload(iso, _vm_uuid)
        client.upload_iso(libvirt_iso_pool_name, File.basename(iso), iso)
      end

      def iso_attach(iso, vm_uuid)
        client.attach_iso(vm_uuid, File.basename(iso))
      end

      def iso_detach(vm_uuid)
        client.detach_iso(vm_uuid)
      end

      def iso_delete(iso, _vm_uuid = nil)
        client.destroy_iso(libvirt_iso_pool_name, File.basename(iso))
      end

      private

      def libvirt_iso_pool_name
        if respond_to?(:volumes) && volumes.present?
          pool = volumes.first.try(:pool_name) || volumes.first.try(:[], 'pool_name')
          return pool if pool.present?
        end

        'default'
      end
    end
  end
end
