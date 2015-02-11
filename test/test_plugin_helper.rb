require 'test_helper'

class ActionController::TestCase
  def setup_bootdisk
    setup_routes
    setup_settings
    setup_templates
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

  def setup_host
    disable_orchestration
    subnet = FactoryGirl.create(:subnet, :gateway => '10.0.1.254', :dns_primary => '8.8.8.8')
    @host = FactoryGirl.create(:host, :managed, :subnet => subnet, :ip => subnet.network.sub(/0$/, '4'))
  end
end
