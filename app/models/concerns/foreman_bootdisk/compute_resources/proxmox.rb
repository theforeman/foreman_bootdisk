# frozen_string_literal: true

module ForemanBootdisk
  module ComputeResources
    module Proxmox
      CDROM_VOLUME = 'ide2'

      def capabilities
        super + [:bootdisk]
      end

      def iso_upload(iso, vm_uuid)
        server = find_vm_by_uuid(vm_uuid)
        server.ssh_options = { password: fog_credentials[:proxmox_password] }
        server.ssh_ip_address = proxmox_host
        server.username = client.credentials[:current_user].split('@').first
        server.scp_upload(iso, '/var/lib/vz/template/iso/')
        server.reload
        storage = storages(server.node_id, 'iso')[0]
        storage.volumes.any? { |v| v.volid.include? File.basename(iso) }
      end

      def iso_attach(iso, vm_uuid)
        server = find_vm_by_uuid(vm_uuid)
        storage = storages(server.node_id, 'iso')[0]
        volume = storage.volumes.detect { |v| v.volid.include? File.basename(iso) }
        disks = server.disks.map { |disk| disk.split(":")[0] }.join(";")
        server.update({ ide2: "#{volume.volid},media=cdrom" })
        server.update({ boot: "order=ide2;#{disks}" })
        server.reboot
      end

      def iso_detach(vm_uuid)
        server = find_vm_by_uuid(vm_uuid)

        # get volid to delete iso after detaching from vm
        volid = server.volumes.get(CDROM_VOLUME).volid
        server.update({ ide2: "none,media=cdrom" })

        # cdrom will be ejected on next power off
        server.detach(CDROM_VOLUME)

        # delete the iso file from proxmox server
        storage = storages(server.node_id, 'iso')[0]
        volume = storage.volumes.detect { |v| v.volid.include? volid }
        volume.destroy
      end
    end
  end
end
