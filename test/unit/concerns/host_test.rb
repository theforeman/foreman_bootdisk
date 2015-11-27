require 'test_plugin_helper'

class ForemanBootdisk::HostTest < ActiveSupport::TestCase
  test "#bootdisk_build? must be true when provision_method is bootdisk" do
    host = FactoryGirl.build(:host, :managed)
    host.provision_method = 'bootdisk'
    assert host.bootdisk_build?
    refute host.image_build?
    refute host.pxe_build?
  end

  test "#validate_media? must be true when provision_method is bootdisk" do
    host = FactoryGirl.build(:host, :managed,
                             :provision_method => "bootdisk",
                             :build => true,
                             )
    assert host.validate_media?
  end

  test "#can_be_built? must be true when provision_method is bootdisk" do
    host = FactoryGirl.build(:host, :managed,
                             :provision_method => "bootdisk"
                             )
    assert host.can_be_built?
  end


  test "host should have bootdisk" do
    if unattended?
      h = FactoryGirl.build(:host, :managed,
                            :provision_method => "bootdisk"
                           )
      assert h.bootdisk?
    end
  end

  test "host should not have bootdisk" do
    if unattended?
      h = FactoryGirl.create(:host)
      assert_equal false, h.bootdisk?
    end
  end
end
