require 'foreman_bootdisk'

module Bootdisk
  class Engine < ::Rails::Engine
    engine_name Bootdisk::ENGINE_NAME

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]

    initializer 'foreman_bootdisk.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path("../../../app/models/setting/bootdisk.rb", __FILE__) if (Setting.table_exists? rescue(false))
    end

    initializer "foreman_bootdisk.load_app_instance_data" do |app|
      app.config.paths['db/migrate'] += Bootdisk::Engine.paths['db/migrate'].existent
    end

    config.to_prepare do
      begin
        ConfigTemplate.send(:include, Bootdisk::ConfigTemplateExt)
        Host::Managed.send(:include, Bootdisk::HostExt)
        HostsController.send(:include, Bootdisk::HostsControllerExt)
        HostsHelper.send(:include, Bootdisk::HostsHelperExt)
        UnattendedController.send(:include, Bootdisk::UnattendedControllerExt)
      rescue => e
        puts "#{Bootdisk::ENGINE_NAME}: skipping engine hook (#{e.to_s})"
      end
    end
  end
end
