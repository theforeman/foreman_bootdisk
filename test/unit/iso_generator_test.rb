require 'test_plugin_helper'

class ForemanBootdisk::IsoGeneratorTest < ActiveSupport::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk
  setup :setup_org_loc
  setup :setup_subnet
  setup :setup_host

  setup do
    @host.build = true
  end

  test "full host image generation generates via PXELinux type" do
    @host.operatingsystem.expects(:pxe_files).returns([])
    @host.operatingsystem.expects(:kernel).returns("kernel")
    @host.operatingsystem.expects(:initrd).returns("initrd")
    ForemanBootdisk::ISOGenerator.expects(:generate).with({:isolinux => nil, :files => []}, anything)
    ForemanBootdisk::ISOGenerator.generate_full_host(@host)
  end
end
