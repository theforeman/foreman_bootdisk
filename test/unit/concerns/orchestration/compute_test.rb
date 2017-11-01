require 'test_plugin_helper'

class ForemanBootdisk::OrchestrationComputeTest < ActiveSupport::TestCase
  setup do
    disable_orchestration
    @cr = FactoryBot.build(:vmware_cr)
    @host = FactoryBot.build(:host, :managed,
                             :compute_resource => @cr,
                             :provision_method => "bootdisk",
                             )
  end

  test "provisioning a host with provision method bootdisk should upload iso" do
    @cr.expects(:iso_upload)
    @host.send(:setIsoImage)
  end

  test "provisioning a host with provision method bootdisk should attach iso" do
    @cr.expects(:iso_attach)
    @host.send(:setAttachIsoImage)
  end

  test "provisioning a host with provision method bootdisk should queue bootdisk tasks" do
    @host.stubs(:compute?).returns(true)
    @host.send(:queue_bootdisk_compute)
    tasks = @host.queue.all.map { |t| t.name }
    assert_includes tasks, "Generating ISO image for #{@host.name}"
    assert_includes tasks, "Upload ISO image to datastore for #{@host.name}"
    assert_includes tasks, "Attach ISO image to CDROM drive for #{@host.name}"
  end

  test "should rebuild bootdisk" do
    @host.expects(:bootdisk_generate_iso_image).returns(true)
    @host.expects(:bootdisk_upload_iso).returns(true)
    @host.expects(:bootdisk_attach_iso).returns(true)
    assert @host.rebuild_with_bootdisk
  end

  test "should skip rebuild bootdisk" do
    host = FactoryBot.build(:host,
                             :compute_resource => @cr
                             )
    host.expects(:bootdisk_generate_iso_image).never
    host.expects(:bootdisk_upload_iso).never
    host.expects(:bootdisk_attach_iso).never
    assert host.rebuild_with_bootdisk
  end
end
