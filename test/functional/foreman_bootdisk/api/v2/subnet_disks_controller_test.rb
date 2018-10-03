# frozen_string_literal: true

require 'test_plugin_helper'

class ForemanBootdisk::Api::V2::SubnetDisksControllerTest < ActionController::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk

  describe '#subnet_host' do
    setup :setup_referer
    setup :setup_org_loc
    setup :setup_subnet
    setup :setup_host

    test 'should generate subnet generic host image' do
      ForemanBootdisk::ISOGenerator.expects(:generate).with(has_entry(ipxe: regexp_matches(/disk generic host template/))).yields('temp ISO')
      ForemanBootdisk::Renderer.any_instance.stubs(:bootdisk_chain_url).yields('http://smart-proxy.lan')
      File.expects(:read).with('temp ISO').returns('ISO image')
      get :subnet, params: { id: @host.subnet.id }
      assert_response :success
      assert_equal 'ISO image', @response.body
    end
  end
end
