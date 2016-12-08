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

  context "#bootdisk_downloadable?" do
    test "should be true for 64 bit architecture" do
      architecture = Architecture.where(:name => 'x86_64').first
      host = FactoryGirl.build(:host, :managed, :architecture => architecture)

      assert host.bootdisk_downloadable?
    end

    test "should be true for 32 bit architecture" do
      architecture = FactoryGirl.create(:architecture, :name => 'i386')
      host = FactoryGirl.build(:host, :managed, :architecture => architecture)

      assert host.bootdisk_downloadable?
    end

    test "should be false for non-intel architecture" do
      architecture = Architecture.where(:name => 's390').first
      host = FactoryGirl.build(:host, :managed, :architecture => architecture)

      assert_not host.bootdisk_downloadable?
    end

    test 'should be true if architecture is absent' do
      host = FactoryGirl.build(:host, :managed, :architecture => nil)

      assert_equal host.architecture, nil
      assert host.bootdisk_downloadable?
    end
  end
end
