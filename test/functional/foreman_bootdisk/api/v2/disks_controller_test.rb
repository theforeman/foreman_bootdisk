# frozen_string_literal: true

require 'test_plugin_helper'

class ForemanBootdisk::Api::V2::DisksControllerTest < ActionController::TestCase
  include ForemanBootdiskTestHelper
  setup :setup_bootdisk
  setup :setup_referer
  setup :setup_org_loc

  def perform_generic_generate
    tmp = create_tempfile
    ForemanBootdisk::ISOGenerator.expects(:generate).yields(create_tempfile.path)
    get :generic
    assert_response :success
  ensure
    tmp.unlink
  end

  def perform_host_generate
    tmp = create_tempfile
    ForemanBootdisk::ISOGenerator.expects(:generate).yields(create_tempfile.path)
    get :host, params: { id: @host.name }
    assert_response :success
  ensure
    tmp.unlink
  end

  def perform_full_host_generate
    tmp = create_tempfile
    ForemanBootdisk::ISOGenerator.expects(:generate_full_host).yields(create_tempfile.path)
    get :host, params: { id: @host.name, full: true }
    assert_response :success
  ensure
    tmp.unlink
  end

  describe '#generic with TFTP' do
    setup :setup_subnet_with_tftp
    setup :setup_host

    test 'should generate generic image' do
      perform_generic_generate
    end

    test 'should generate host image' do
      perform_host_generate
    end

    test 'should generate full host image' do
      perform_full_host_generate
    end
  end

  describe '#subnet_host with TFTP and HTTPBOOT' do
    setup :setup_subnet_with_tftp_httpboot_template
    setup :setup_host

    test 'should generate generic image' do
      perform_generic_generate
    end

    test 'should generate host image' do
      perform_host_generate
    end

    test 'should generate full host image' do
      perform_full_host_generate
    end
  end

  describe 'default API version 2' do
    setup :setup_host_env

    test 'path - /api/hosts/:host_id routes to #host' do
      expected_path = if Rails::VERSION::MAJOR >= 5
                        "/api/v2/hosts/#{@host.id}"
                      else
                        "/api/hosts/#{@host.id}"
                      end
      assert_routing expected_path,
                     format: 'json',
                     apiv: 'v2',
                     controller: 'foreman_bootdisk/api/v2/disks',
                     action: 'host',
                     id: @host.id.to_s
    end

    test 'path - /api/generic routes to #generic' do
      assert_routing '/api/generic',
                     format: 'json',
                     apiv: 'v2',
                     controller: 'foreman_bootdisk/api/v2/disks',
                     action: 'generic'
    end
  end
end
