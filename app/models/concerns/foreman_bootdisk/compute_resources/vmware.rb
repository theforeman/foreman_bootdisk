module ForemanBootdisk
  module ComputeResources
    module Vmware
      def capabilities
        super + [:bootdisk]
      end

      def parse_args(args = {})
        args = super
        if args[:provision_method] == 'bootdisk'
          args[:cdroms] = [new_cdrom]
          args[:boot_order] = ['cdrom', 'disk']
          args[:boot_retry] = 10
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
