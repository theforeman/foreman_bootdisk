require 'foreman_bootdisk'
require 'fast_gettext'
require 'gettext_i18n_rails'

module ForemanBootdisk
  class Engine < ::Rails::Engine
    isolate_namespace ForemanBootdisk

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]

    initializer 'foreman_bootdisk.mount_engine', :after=> :build_middleware_stack do |app|
      app.routes_reloader.paths << "#{ForemanBootdisk::Engine.root}/config/routes/mount_engine.rb"
    end

    initializer 'foreman_bootdisk.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path("../../../app/models/setting/bootdisk.rb", __FILE__) if (Setting.table_exists? rescue(false))
    end

    initializer "foreman_bootdisk.load_app_instance_data" do |app|
      app.config.paths['db/migrate'] += ForemanBootdisk::Engine.paths['db/migrate'].existent
    end

    initializer "foreman_bootdisk.apipie" do
      Apipie.configuration.checksum_path += ['/bootdisk/api/']
    end

    initializer 'foreman_bootdisk.register_plugin', :after=> :finisher_hook do |app|
      Foreman::Plugin.register :foreman_bootdisk do
        requires_foreman '>= 1.9'

        security_block :bootdisk do |map|
          permission :download_bootdisk, {:'foreman_bootdisk/disks' => [:generic, :host, :full_host, :help],
                                          :'foreman_bootdisk/api/v2/disks' => [:generic, :host]}
        end

        role "Boot disk access", [:download_bootdisk]

        allowed_template_helpers :bootdisk_chain_url, :bootdisk_raise
        apipie_documented_controllers ["#{ForemanBootdisk::Engine.root}/app/controllers/foreman_bootdisk/api/v2/*.rb"]
      end
    end

    initializer 'foreman_bootdisk.register_gettext', :after => :load_config_initializers do |app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_bootdisk'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end

    config.to_prepare do
      begin
        Host::Managed.send(:include, ForemanBootdisk::HostExt)
        HostsHelper.send(:include, ForemanBootdisk::HostsHelperExt)
        UnattendedController.send(:include, ForemanBootdisk::UnattendedControllerExt)
      rescue => e
        puts "#{ForemanBootdisk::ENGINE_NAME}: skipping engine hook (#{e.to_s})"
      end
    end
  end
end
