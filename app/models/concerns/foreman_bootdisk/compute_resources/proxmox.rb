# frozen_string_literal: true

module ForemanBootdisk
  module ComputeResources
    module Proxmox
      CDROM_VOLUME = 'ide2'

      def capabilities
        super + [:bootdisk]
      end

      def iso_upload(iso, vm_uuid, storage_id: nil)
        server = find_vm_by_uuid(vm_uuid)
        upload_iso(server.node_id, storage_id, iso)
      end

      def iso_delete(iso, vm_uuid)
        server = find_vm_by_uuid(vm_uuid)
        filename = File.basename(iso)

        volumes = storages(server.node_id, 'iso').filter_map do |storage|
          storage.volumes.find { |volume| File.basename(volume.volid) == filename }
        end

        if volumes.many?
          raise ::Foreman::Exception,
                format(_('Found multiple ISO images named %{iso}'), iso: filename)
        end

        volumes.first&.destroy
      end

      def iso_attach(iso, vm_uuid, storage_id: nil)
        server = find_vm_by_uuid(vm_uuid)
        storage = storages(server.node_id, 'iso').find { |candidate| candidate.identity == storage_id }
        volume = storage&.volumes&.detect { |v| v.volid.include? File.basename(iso) }
        raise ::Foreman::Exception, format(_('Could not find ISO %{iso} on storage %{storage}'), iso: File.basename(iso), storage: storage_id) unless volume

        disks = server.disks.map { |disk| disk.split(':')[0] }.join(';')
        server.update({ ide2: "#{volume.volid},media=cdrom" })
        server.update({ boot: "order=ide2;#{disks}" })
      end

      def iso_detach(vm_uuid)
        server = find_vm_by_uuid(vm_uuid)
        server.update({ ide2: "none,media=cdrom" })

        # cdrom will be ejected on next power off
        server.detach(CDROM_VOLUME)
      end
    end
  end
end
