# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class OrchestrationProxmoxComputeTest < ActiveSupport::TestCase
    setup do
      disable_orchestration
      skip unless ForemanBootdisk.with_proxmox?
      @proxmox_cr = FactoryBot.build(:proxmox_cr)
      @proxmox_host = FactoryBot.build(:host, :managed,
                                       compute_resource: @proxmox_cr,
                                       provision_method: 'bootdisk')
    end

    test 'returns selected iso upload storage from compute attributes' do
      @proxmox_host.compute_attributes = { 'iso_upload_storage' => 'iso-storage' }

      assert_equal 'iso-storage', @proxmox_host.send(:bootdisk_iso_upload_storage)
    end

    test 'iso upload storage is unavailable while deleting' do
      @proxmox_host.compute_attributes = { 'iso_upload_storage' => 'iso-storage' }
      @proxmox_host.save!

      host = Host::Managed.find(@proxmox_host.id)
      host.compute_resource.expects(:iso_delete).with(anything, anything)

      assert_nil host.send(:bootdisk_iso_upload_storage)
      host.send(:setDeleteIsoImage)
    end

    test 'provisioning a host with provision method bootdisk in proxmox should upload iso' do
      @proxmox_host.compute_attributes = { 'iso_upload_storage' => 'iso-storage' }
      @proxmox_cr.expects(:iso_upload).with(anything, anything, storage_id: 'iso-storage')
      @proxmox_host.send(:setIsoImage)
    end

    test 'provisioning a host with provision method bootdisk in proxmox should attach iso' do
      @proxmox_host.compute_attributes = { 'iso_upload_storage' => 'iso-storage' }
      @proxmox_cr.expects(:iso_attach).with(anything, anything, storage_id: 'iso-storage')
      @proxmox_host.send(:setAttachIsoImage)
    end

    test 'provisioning a host with provision method bootdisk in proxmox should detach iso' do
      @proxmox_cr.expects(:iso_detach)
      @proxmox_host.send(:setDetachIsoImage)
    end

    test 'provisioning a new proxmox host with provision method bootdisk should queue bootdisk tasks' do
      @proxmox_host.stubs(:compute?).returns(true)
      @proxmox_host.stubs(:build?).returns(true)
      @proxmox_host.send(:queue_bootdisk_compute)
      tasks = @proxmox_host.queue.all.map(&:name)
      assert_includes tasks, "Generating ISO image for #{@proxmox_host.name}"
      assert_includes tasks, "Upload ISO image to datastore for #{@proxmox_host.name}"
      assert_includes tasks, "Attach ISO image to CDROM drive for #{@proxmox_host.name}"
      assert_not_includes tasks, "Detach ISO image from CDROM drive for #{@proxmox_host.name}"
    end

    test 'rebuilding a proxmox host with provision method bootdisk should queue bootdisk tasks' do
      @proxmox_host.stubs(:compute?).returns(true)
      old = stub()
      old.stubs(:build?).returns(false)
      @proxmox_host.stubs(:old).returns(old)
      @proxmox_host.stubs(:build?).returns(true)
      @proxmox_host.send(:queue_bootdisk_compute)
      tasks = @proxmox_host.queue.all.map(&:name)
      assert_includes tasks, "Generating ISO image for #{@proxmox_host.name}"
      assert_includes tasks, "Upload ISO image to datastore for #{@proxmox_host.name}"
      assert_includes tasks, "Attach ISO image to CDROM drive for #{@proxmox_host.name}"
      assert_not_includes tasks, "Detach ISO image from CDROM drive for #{@proxmox_host.name}"
    end

    test 'the iso should be detached when the proxmox host leaves build mode' do
      @proxmox_host.stubs(:compute?).returns(true)
      old = stub()
      old.stubs(:build?).returns(true)
      @proxmox_host.stubs(:old).returns(old)
      @proxmox_host.stubs(:build?).returns(false)
      @proxmox_host.send(:queue_bootdisk_compute)
      tasks = @proxmox_host.queue.all.map(&:name)
      assert_not_includes tasks, "Generating ISO image for #{@proxmox_host.name}"
      assert_not_includes tasks, "Upload ISO image to datastore for #{@proxmox_host.name}"
      assert_not_includes tasks, "Attach ISO image to CDROM drive for #{@proxmox_host.name}"
      assert_includes tasks, "Detach ISO image from CDROM drive for #{@proxmox_host.name}"
    end
  end
end
