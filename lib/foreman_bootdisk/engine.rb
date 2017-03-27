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
      ForemanBootdisk::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer "foreman_bootdisk.apipie" do
      Apipie.configuration.checksum_path += ['/bootdisk/api/']
    end

    # Precompile any JS or CSS files under app/assets/
    # If requiring files from each other, list them explicitly here to avoid precompiling the same
    # content twice.
    assets_to_precompile =
      Dir.chdir(root) do
        Dir['app/assets/javascripts/**/*', 'app/assets/stylesheets/**/*'].map do |f|
          f.split(File::SEPARATOR, 4).last
        end
      end

    initializer 'foreman_bootdisk.assets.precompile' do |app|
      app.config.assets.precompile += assets_to_precompile
    end

    initializer 'foreman_bootdisk.configure_assets', group: :assets do
      SETTINGS[:foreman_bootdisk] = { assets: { precompile: assets_to_precompile } }
    end

    initializer 'foreman_bootdisk.register_plugin', :before => :finisher_hook do |app|
      Foreman::Plugin.register :foreman_bootdisk do
        requires_foreman '>= 1.15'

        security_block :bootdisk do |map|
          permission :download_bootdisk, {:'foreman_bootdisk/disks' => [:generic, :host, :full_host, :subnet, :help],
                                          :'foreman_bootdisk/api/v2/disks' => [:generic, :host],
                                          :'foreman_bootdisk/api/v2/subnet_disks' => [:subnet]}
        end

        role "Boot disk access", [:download_bootdisk]

        add_all_permissions_to_default_roles

        allowed_template_helpers :bootdisk_chain_url, :bootdisk_raise
        apipie_documented_controllers ["#{ForemanBootdisk::Engine.root}/app/controllers/foreman_bootdisk/api/v2/*.rb"]
        provision_method 'bootdisk', N_('Boot disk based')
        template_labels 'Bootdisk' => N_('Boot disk embedded template')
        extend_template_helpers ForemanBootdisk::RendererMethods
      end
    end

    initializer 'foreman_bootdisk.register_gettext', :after => :load_config_initializers do |app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_bootdisk'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end

    config.to_prepare do
      begin
        Host::Managed.send(:prepend, ForemanBootdisk::HostExt)
        Host::Managed.send(:include, ForemanBootdisk::Orchestration::Compute) if SETTINGS[:unattended]
        HostsHelper.send(:prepend, ForemanBootdisk::HostsHelperExt)
        UnattendedController.send(:prepend, ForemanBootdisk::UnattendedControllerExt)
        Foreman::Model::Vmware.send(:prepend, ForemanBootdisk::ComputeResources::Vmware) if Foreman::Model::Vmware.available?
      rescue => e
        puts "#{ForemanBootdisk::ENGINE_NAME}: skipping engine hook (#{e.to_s})"
      end
    end
  end

  def self.logger
    Foreman::Logging.logger('foreman_bootdisk')
  end
end
