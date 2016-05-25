module ForemanBootdisk
  module ComputeResources
    module Vmware
      extend ActiveSupport::Concern

      included do
        alias_method_chain :capabilities, :bootdisk
        alias_method_chain :parse_args, :bootdisk
      end

      def capabilities_with_bootdisk
        capabilities_without_bootdisk + [:bootdisk]
      end

      def parse_args_with_bootdisk(args = {})
        args = parse_args_without_bootdisk args
        if args[:provision_method] == 'bootdisk'
          args[:cdroms] = [new_cdrom]
          args[:boot_order] = ['cdrom', 'disk']
        end
        args
      end

      def bootdisk_datastore(vm_uuid)
        find_vm_by_uuid(vm_uuid).volumes.first.datastore
      end

      def iso_upload(iso, vm_uuid)
        options = {
          'local_path' => iso,
          'datacenter' => dc.name,
          'datastore' => bootdisk_datastore(vm_uuid),
          'upload_directory' => 'foreman_isos' # fog creates the directory if it does not exist
        }
        client.upload_iso options
      end

      def iso_attach(iso, vm_uuid)
        options = {
          'instance_uuid' => vm_uuid,
          'iso' => "foreman_isos/#{iso}",
          'datastore' => bootdisk_datastore(vm_uuid),
          'start_connected' => false,
          'connected' => true,
          'allow_guest_control' => true
        }
        client.vm_reconfig_cdrom options
      end
    end
  end
end
