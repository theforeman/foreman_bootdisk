require 'test_plugin_helper'

class ForemanBootdisk::DisksControllerTest < ActionController::TestCase
  setup :setup_bootdisk

  test "should generate generic image" do
    ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk generic host template/))).yields("temp ISO")
    File.expects(:read).with("temp ISO").returns("ISO image")
    get :generic, {}, set_session_user
    assert_response :success
    assert_equal "ISO image", @response.body
  end

  describe "#host" do
    setup :setup_org_loc
    setup :setup_subnet
    setup :setup_host

    test "should generate host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk host template/))).yields("temp ISO")
      File.expects(:read).with("temp ISO").returns("ISO image")
      get :host, {:id => @host.name}, set_session_user
      assert_response :success
      assert_equal "ISO image", @response.body
    end

    test "should generate full host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate_full_host).with(@host).yields("temp ISO")
      File.expects(:read).with("temp ISO").returns("ISO image")
      get :full_host, {:id => @host.name}, set_session_user
      assert_response :success
      assert_equal "ISO image", @response.body
    end

    test "should generate subnet image" do
      ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk generic host template/))).yields("temp ISO")
      ForemanBootdisk::Renderer.any_instance.stubs(:bootdisk_chain_url).yields("http://smart-proxy.lan")
      File.expects(:read).with("temp ISO").returns("ISO image")
      get :subnet, {:id => @host.name}, set_session_user
      assert_empty flash[:error]
      assert_response :success
      assert_equal "ISO image", @response.body
    end
  end

  describe "#host without tftp" do
    setup :setup_org_loc
    setup :setup_subnet_no_tftp
    setup :setup_host

    test "should not generate subnet image" do
      get :subnet, {:id => @host.name}, set_session_user
      assert_match(/Failed.*: TFTP feature not enabled/, flash[:error])
      assert_response :redirect
    end
  end

  test "should render help" do
    get :help, {}, set_session_user
    assert_response :success
  end
end
