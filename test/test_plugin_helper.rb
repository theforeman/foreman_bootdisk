# frozen_string_literal: true

require 'test_helper'

module ForemanBootdiskTestHelper
  def setup_bootdisk
    setup_routes
    setup_settings
    setup_templates
  end

  def setup_host_env
    setup_org_loc
    setup_subnet
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

  def setup_subnet
    tftp_proxy = FactoryBot.create(:smart_proxy, features: [FactoryBot.create(:tftp_feature)])
    setup_subnet_no_tftp.update! tftp: tftp_proxy
  end

  def setup_subnet_no_tftp
    @subnet = FactoryBot.create(:subnet_ipv4, gateway: '10.0.1.254', dns_primary: '8.8.8.8', organizations: [@org], locations: [@loc])
  end

  def setup_host
    @host = FactoryBot.create(:host, :managed, subnet: @subnet, ip: @subnet.network.sub(/0$/, '4'), organization: @org, location: @loc)
  end
end
