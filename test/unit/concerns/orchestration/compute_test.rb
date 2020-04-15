# frozen_string_literal: true

require 'test_plugin_helper'

module ForemanBootdisk
  class OrchestrationComputeTest < ActiveSupport::TestCase
    setup do
      disable_orchestration
      @cr = FactoryBot.build(:vmware_cr)
      @host = FactoryBot.build(:host, :managed,
                               compute_resource: @cr,
                               provision_method: 'bootdisk')
    end

    test 'provisioning a host with provision method bootdisk should upload iso' do
      @cr.expects(:iso_upload)
      @host.send(:setIsoImage)
    end

    test 'provisioning a host with provision method bootdisk should attach iso' do
      @cr.expects(:iso_attach)
      @host.send(:setAttachIsoImage)
    end

    test 'provisioning a host with provision method bootdisk should detach iso' do
      @cr.expects(:iso_detach)
      @host.send(:setDetachIsoImage)
    end

    test 'provisioning a new host with provision method bootdisk should queue bootdisk tasks' do
      @host.stubs(:compute?).returns(true)
      @host.stubs(:build?).returns(true)
      @host.send(:queue_bootdisk_compute)
      tasks = @host.queue.all.map(&:name)
      assert_includes tasks, "Generating ISO image for #{@host.name}"
      assert_includes tasks, "Upload ISO image to datastore for #{@host.name}"
      assert_includes tasks, "Attach ISO image to CDROM drive for #{@host.name}"
      assert_not_includes tasks, "Detach ISO image from CDROM drive for #{@host.name}"
    end

    test 'rebuilding a host with provision method bootdisk should queue bootdisk tasks' do
      @host.stubs(:compute?).returns(true)
      old = stub()
      old.stubs(:build?).returns(false)
      @host.stubs(:old).returns(old)
      @host.stubs(:build?).returns(true)
      @host.send(:queue_bootdisk_compute)
      tasks = @host.queue.all.map(&:name)
      assert_includes tasks, "Generating ISO image for #{@host.name}"
      assert_includes tasks, "Upload ISO image to datastore for #{@host.name}"
      assert_includes tasks, "Attach ISO image to CDROM drive for #{@host.name}"
      assert_not_includes tasks, "Detach ISO image from CDROM drive for #{@host.name}"
    end

    test 'the iso should be detached when the host leaves build mode' do
      @host.stubs(:compute?).returns(true)
      old = stub()
      old.stubs(:build?).returns(true)
      @host.stubs(:old).returns(old)
      @host.stubs(:build?).returns(false)
      @host.send(:queue_bootdisk_compute)
      tasks = @host.queue.all.map(&:name)
      assert_not_includes tasks, "Generating ISO image for #{@host.name}"
      assert_not_includes tasks, "Upload ISO image to datastore for #{@host.name}"
      assert_not_includes tasks, "Attach ISO image to CDROM drive for #{@host.name}"
      assert_includes tasks, "Detach ISO image from CDROM drive for #{@host.name}"
    end
  end
end
