# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class ProxmoxTest < ActiveSupport::TestCase

    describe '#capabilities' do
      setup do
        skip unless ForemanBootdisk.with_proxmox?
        @cr = FactoryBot.build(:proxmox_cr)
      end

      test 'should include bootdisk' do
        assert_includes @cr.capabilities, :bootdisk
      end
    end

    describe '#iso_upload' do
      setup do
        skip unless ForemanBootdisk.with_proxmox?
        @cr = FactoryBot.build(:proxmox_cr)
      end

      test 'uploads the ISO to the selected storage on the VM node' do
        server = stub(node_id: 'node-1')
        @cr.stubs(:find_vm_by_uuid).with('vm-uuid').returns(server)
        @cr.expects(:upload_iso).with('node-1', 'iso-storage', '/tmp/host.iso').once

        @cr.iso_upload('/tmp/host.iso', 'vm-uuid', storage_id: 'iso-storage')
      end
    end

    describe '#iso_attach' do
      setup do
        skip unless ForemanBootdisk.with_proxmox?
        @cr = FactoryBot.build(:proxmox_cr)
        @server = stub(node_id: 'node-1', disks: ['scsi0: local-lvm:vm-100-disk-0', 'net0: virtio=00:11:22:33:44:55'])
        @cr.stubs(:find_vm_by_uuid).with('vm-uuid').returns(@server)
      end

      test 'attaches the ISO from the selected storage' do
        other_storage = stub(identity: 'other-storage')
        volume = stub(volid: 'iso-storage:iso/host.iso')
        selected_storage = stub(identity: 'iso-storage', volumes: [volume])
        @cr.stubs(:storages).with('node-1', 'iso').returns([other_storage, selected_storage])
        @server.expects(:update).with({ ide2: 'iso-storage:iso/host.iso,media=cdrom' }).once
        @server.expects(:update).with({ boot: 'order=ide2;scsi0;net0' }).once

        @cr.iso_attach('host.iso', 'vm-uuid', storage_id: 'iso-storage')
      end

      test 'raises and does not update the VM when the selected storage does not exist' do
        storage = stub(identity: 'other-storage')
        @cr.stubs(:storages).with('node-1', 'iso').returns([storage])
        @server.expects(:update).never

        error = assert_raises(::Foreman::Exception) do
          @cr.iso_attach('host.iso', 'vm-uuid', storage_id: 'iso-storage')
        end

        assert_includes error.message, 'Could not find ISO host.iso on storage iso-storage'
      end

      test 'raises and does not update the VM when the ISO does not exist on the selected storage' do
        volume = stub(volid: 'iso-storage:iso/other.iso')
        storage = stub(identity: 'iso-storage', volumes: [volume])
        @cr.stubs(:storages).with('node-1', 'iso').returns([storage])
        @server.expects(:update).never

        error = assert_raises(::Foreman::Exception) do
          @cr.iso_attach('host.iso', 'vm-uuid', storage_id: 'iso-storage')
        end

        assert_includes error.message, 'Could not find ISO host.iso on storage iso-storage'
      end
    end

    describe '#iso_delete' do
      setup do
        skip unless ForemanBootdisk.with_proxmox?
        @cr = FactoryBot.build(:proxmox_cr)
        @server = stub(node_id: 'node-1')
        @cr.stubs(:find_vm_by_uuid).with('vm-uuid').returns(@server)
      end

      test 'deletes the matching ISO from any ISO storage' do
        other_volume = stub(volid: 'local:iso/other.iso')
        matching_volume = stub(volid: 'iso-storage:iso/host.iso')
        other_storage = stub(volumes: [other_volume])
        matching_storage = stub(volumes: [matching_volume])
        @cr.stubs(:storages).with('node-1', 'iso').returns([other_storage, matching_storage])
        other_volume.expects(:destroy).never
        matching_volume.expects(:destroy).once

        @cr.iso_delete('/tmp/host.iso', 'vm-uuid')
      end

      test 'does nothing when the ISO does not exist' do
        volume = stub(volid: 'local:iso/other.iso')
        storage = stub(volumes: [volume])
        @cr.stubs(:storages).with('node-1', 'iso').returns([storage])
        volume.expects(:destroy).never

        assert_nil @cr.iso_delete('/tmp/host.iso', 'vm-uuid')
      end

      test 'raises and does not delete when the ISO exists on multiple storages' do
        first_volume = stub(volid: 'local:iso/host.iso')
        second_volume = stub(volid: 'iso-storage:iso/host.iso')
        first_storage = stub(volumes: [first_volume])
        second_storage = stub(volumes: [second_volume])
        @cr.stubs(:storages).with('node-1', 'iso').returns([first_storage, second_storage])
        first_volume.expects(:destroy).never
        second_volume.expects(:destroy).never

        error = assert_raises(::Foreman::Exception) do
          @cr.iso_delete('/tmp/host.iso', 'vm-uuid')
        end

        assert_includes error.message, 'Found multiple ISO images named host.iso'
      end
    end
  end
end
