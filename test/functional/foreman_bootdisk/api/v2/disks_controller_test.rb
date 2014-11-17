require 'test_plugin_helper'

class ForemanBootdisk::Api::V2::DisksControllerTest < ActionController::TestCase
  setup :setup_bootdisk

  test "should generate generic image" do
    ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/generic host template/))).yields("temp ISO")
    File.expects(:read).with("temp ISO").returns("ISO image")
    get :generic, {}
    assert_response :success
    assert_equal "ISO image", @response.body
  end

  describe "#host" do
    setup :setup_host

    test "should generate host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/host template/))).yields("temp ISO")
      File.expects(:read).with("temp ISO").returns("ISO image")
      get :host, {:id => @host.name}
      assert_response :success
      assert_equal "ISO image", @response.body
    end

    test "should generate full host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate_full_host).with(@host).yields("temp ISO")
      File.expects(:read).with("temp ISO").returns("ISO image")
      get :host, {:id => @host.name, :full => true}
      assert_response :success
      assert_equal "ISO image", @response.body
    end
  end
end
