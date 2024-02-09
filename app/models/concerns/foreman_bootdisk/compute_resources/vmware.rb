# frozen_string_literal: true

module ForemanBootdisk
  module ComputeResources
    module Vmware
      def capabilities
        super + [:bootdisk]
      end

      def parse_args(args = {})
        args = super(args)
        if args[:provision_method] == 'bootdisk'
          args[:cdroms] = [new_cdrom]
          args[:boot_order] = %w[cdrom disk]
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
        controller = controller_config(vm_uuid)
        options = {
          'instance_uuid' => vm_uuid,
          'iso' => "foreman_isos/#{iso}",
          'datastore' => bootdisk_datastore(vm_uuid),
          'start_connected' => true,
          'connected' => true,
          'allow_guest_control' => true,
          'controller_key' => controller[:key]
        }
	vm = find_vm_by_uuid(vm_uuid)
	vm.stop if vm.ready?
	vm.reload
        client.vm_reconfig_cdrom options
	vm.start if !vm.ready?
      end

      def iso_detach(vm_uuid)
        options = {
          'instance_uuid' => vm_uuid,
          'start_connected' => false,
          'connected' => false,
        }
        client.vm_reconfig_cdrom options
      end

      def controller_config(vm_uuid)
        options = OpenStruct.new(server_id: vm_uuid, attributes: {type: RbVmomi::VIM.VirtualAHCIController.class})
        client.add_vm_controller(options)
        client.get_vm_first_sata_controller(vm_uuid)
      end
    end
  end
end
