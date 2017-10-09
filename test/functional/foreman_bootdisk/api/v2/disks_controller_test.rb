require 'test_plugin_helper'

class ForemanBootdisk::Api::V2::DisksControllerTest < ActionController::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk

  test "should generate generic image" do
    ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk generic host template/))).yields("temp ISO")
    @controller.expects(:read_file).with("temp ISO").returns("ISO image")
    get :generic, {}
    assert_response :success
    assert_equal "ISO image", @response.body
  end

  describe "#host" do
    setup :setup_referer
    setup :setup_host_env

    test "should generate host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(:ipxe => regexp_matches(/disk host template/))).yields("temp ISO")
      @controller.expects(:read_file).with("temp ISO").returns("ISO image")
      get :host, {:id => @host.name}
      assert_response :success
      assert_equal "ISO image", @response.body
    end

    test "should generate full host image" do
      ForemanBootdisk::ISOGenerator.expects(:generate_full_host).with(@host).yields("temp ISO")
      @controller.expects(:read_file).with("temp ISO").returns("ISO image")
      get :host, {:id => @host.name, :full => true}
      assert_response :success
      assert_equal "ISO image", @response.body
    end
  end

  describe "default API version 2" do
    setup :setup_host_env

    test "path - /api/hosts/:host_id routes to #host" do
      if Rails::VERSION::MAJOR >= 5
        expected_path = "/api/v2/hosts/#{@host.id}"
      else
        expected_path = "/api/hosts/#{@host.id}"
      end
      assert_routing expected_path,
                     :format     => "json",
                     :apiv       => "v2",
                     :controller => "foreman_bootdisk/api/v2/disks",
                     :action     => "host",
                     :id         => @host.id.to_s
    end

    test "path - /api/generic routes to #generic" do
      assert_routing "/api/generic",
                     :format     => "json",
                     :apiv       => "v2",
                     :controller => "foreman_bootdisk/api/v2/disks",
                     :action     => "generic"
    end
  end
end
