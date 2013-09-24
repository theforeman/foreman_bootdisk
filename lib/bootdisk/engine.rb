require 'foreman_bootdisk'
require 'fast_gettext'
require 'gettext_i18n_rails'

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

    initializer 'foreman_bootdisk.register_plugin', :after=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_bootdisk do
        requires_foreman '>= 1.4'

        security_block :bootdisk do |map|
          permission :download_bootdisk, {:hosts => [:bootdisk_iso],
                                          :'bootdisk/disks' => [:generic_iso, :index]}
        end

        role "Boot disk access", [:download_bootdisk] unless (Role.count rescue nil).nil?
      end
    end

    initializer 'foreman_bootdisk.register_gettext', :after => :load_config_initializers do |app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'bootdisk'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
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

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        Bootdisk::Engine.load_seed
      end
    end
  end
end
