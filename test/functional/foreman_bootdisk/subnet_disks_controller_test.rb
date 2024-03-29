# frozen_string_literal: true

require 'test_plugin_helper'

class ForemanBootdisk::SubnetDisksControllerTest < ActionController::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk
  setup :setup_referer
  setup :setup_org_loc

  def perform_subnet_generate
    tmp = create_tempfile
    ForemanBootdisk::ISOGenerator.expects(:generate).yields(create_tempfile.path)
    get :subnet, params: { id: @subnet.id }, session: set_session_user
    assert_empty flash[:error]
    assert_response :success
  ensure
    tmp.unlink
  end

  describe '#generic with TFTP' do
    setup :setup_subnet_with_tftp
    setup :setup_host

    test 'should generate subnet image' do
      perform_subnet_generate
    end
  end

  describe '#subnet_host with TFTP and HTTPBOOT' do
    setup :setup_subnet_with_tftp_httpboot_template
    setup :setup_host

    test 'should generate subnet image' do
      perform_subnet_generate
    end
  end

  describe '#host without tftp' do
    setup :setup_referer
    setup :setup_org_loc
    setup :setup_subnet_no_tftp
    setup :setup_host

    test 'should not generate subnet image' do
      get :subnet, params: { id: @subnet.id }, session: set_session_user
      assert_match(/Failed.*: TFTP feature not enabled/, flash[:error])
      assert_response :redirect
    end
  end
end
