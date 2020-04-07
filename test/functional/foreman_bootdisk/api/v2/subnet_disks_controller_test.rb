# frozen_string_literal: true

require 'test_plugin_helper'

class ForemanBootdisk::Api::V2::SubnetDisksControllerTest < ActionController::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk
  setup :setup_referer
  setup :setup_org_loc

  def perform_subnet_generate
    tmp = create_tempfile
    ForemanBootdisk::ISOGenerator.expects(:generate).yields(create_tempfile.path)
    get :subnet, params: { id: @host.subnet.id }
    assert_response :success
  ensure
    tmp.unlink
  end

  describe '#subnet_host with TFTP' do
    setup :setup_subnet_with_tftp
    setup :setup_host

    test 'should generate subnet generic host image' do
      perform_subnet_generate
    end
  end

  describe '#subnet_host with TFTP and HTTPBOOT' do
    setup :setup_subnet_with_tftp_httpboot_template
    setup :setup_host

    test 'should generate subnet generic host image' do
      perform_subnet_generate
    end
  end
end
