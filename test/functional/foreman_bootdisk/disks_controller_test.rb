require 'test_plugin_helper'

class ForemanBootdisk::DisksControllerTest < ActionController::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk

  test "should generate generic image" do
    ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk generic host template/))).yields("temp ISO")
    @controller.expects(:read_file).with("temp ISO").returns("ISO image")
    get :generic, session: set_session_user
    assert_response :success
    assert_equal "ISO image", @response.body
  end

  describe "#host" do
    setup :setup_referer
    setup :setup_org_loc
    setup :setup_subnet
    setup :setup_host

    test "should generate host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk host template/))).yields("temp ISO")
      @controller.expects(:read_file).with("temp ISO").returns("ISO image")
      get :host, params: {:id => @host.name}, session: set_session_user
      assert_response :success
      assert_equal "ISO image", @response.body
    end

    test "should generate full host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate_full_host).with(@host).yields("temp ISO")
      @controller.expects(:read_file).with("temp ISO").returns("ISO image")
      get :full_host, params: {:id => @host.name}, session: set_session_user
      assert_response :success
      assert_equal "ISO image", @response.body
    end

    test "should generate subnet image" do
      ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk generic host template/))).yields("temp ISO")
      ForemanBootdisk::Renderer.any_instance.stubs(:bootdisk_chain_url).yields("http://smart-proxy.lan")
      @controller.expects(:read_file).with("temp ISO").returns("ISO image")
      get :subnet, params: {:id => @host.name}, session: set_session_user
      assert_empty flash[:error]
      assert_response :success
      assert_equal "ISO image", @response.body
    end
  end

  describe "#host without tftp" do
    setup :setup_referer
    setup :setup_org_loc
    setup :setup_subnet_no_tftp
    setup :setup_host

    test "should not generate subnet image" do
      get :subnet, params: {:id => @host.name}, session: set_session_user
      assert_match(/Failed.*: TFTP feature not enabled/, flash[:error])
      assert_response :redirect
    end
  end

  test "should render help" do
    get :help, session: set_session_user
    assert_response :success
  end
end
