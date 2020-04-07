# frozen_string_literal: true

require 'test_helper'
require 'webmock/minitest'
require 'webmock'

module ForemanBootdiskTestHelper
  def create_tempfile
    file = Tempfile.new('bootdisk-test', '/tmp')
    file.close
    file
  end

  def setup_bootdisk
    ForemanBootdisk::Scope::Bootdisk.any_instance.stubs(:bootdisk_chain_url).returns('http://smart-proxy.example.com/unattended/iPXE?mac=')
    setup_routes
    setup_settings
    setup_templates
  end

  # TODO remove me
  def setup_host_env
    setup_org_loc
    setup_subnet_with_tftp
    setup_host
  end

  def setup_routes
    @routes = ForemanBootdisk::Engine.routes
  end

  def setup_settings
    Setting::Bootdisk.load_defaults
  end

  def setup_templates
    load File.join(File.dirname(__FILE__), '..', 'db', 'seeds.d', '50-bootdisk_templates.rb')
  end

  def setup_referer
    request.env['HTTP_REFERER'] = '/history'
  end

  def setup_org_loc
    disable_orchestration
    @org = FactoryBot.create(:organization)
    @loc = FactoryBot.create(:location)
  end

  def setup_subnet_with_tftp_httpboot_template
    ProxyAPI::V2::Features.any_instance.stubs(:features).returns(:httpboot => { :settings => { :https_port => 1234 }, :state => 'running' }, :templates => {}, :tftp => {})
    SmartProxy.any_instance.stubs(:httpboot_http_port).returns('8888')
    SmartProxy.any_instance.stubs(:httpboot_https_port).returns('9999')

    proxy = FactoryBot.create(:smart_proxy, features: [FactoryBot.create(:tftp_feature), FactoryBot.create(:feature, :templates), FactoryBot.create(:feature, :httpboot)])
    proxy.reload
    setup_subnet_no_tftp.update! tftp: proxy, httpboot: proxy, template: proxy
  end

  def setup_subnet_with_tftp
    tftp_proxy = FactoryBot.create(:smart_proxy, features: [FactoryBot.create(:tftp_feature)])
    setup_subnet_no_tftp.update! tftp: tftp_proxy
  end

  def setup_subnet_no_tftp
    @subnet = FactoryBot.create(:subnet_ipv4, gateway: '10.0.1.254', dns_primary: '8.8.8.8', organizations: [@org], locations: [@loc])
  end

  def setup_host
    @host = FactoryBot.create(:host, :managed, subnet: @subnet, ip: @subnet.network.sub(/0$/, '4'), organization: @org, location: @loc, build: true)
  end
end
