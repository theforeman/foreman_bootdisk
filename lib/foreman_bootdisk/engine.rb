# frozen_string_literal: true

require 'foreman_bootdisk'
require 'fast_gettext'
require 'gettext_i18n_rails'

module ForemanBootdisk
  class Engine < ::Rails::Engine
    isolate_namespace ForemanBootdisk

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/lib"]

    initializer 'foreman_bootdisk.mount_engine' do |app|
      app.routes_reloader.paths << "#{ForemanBootdisk::Engine.root}/config/routes/mount_engine.rb"
    end

    initializer 'foreman_bootdisk.load_default_settings', before: :load_config_initializers do |_app|
      table_exists = begin
                       Setting.table_exists?
                     rescue StandardError
                       false
                     end
      require_dependency File.expand_path('../../app/models/setting/bootdisk.rb', __dir__) if table_exists
    end

    initializer 'foreman_bootdisk.load_app_instance_data' do |app|
      ForemanBootdisk::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_bootdisk.apipie' do
      Apipie.configuration.checksum_path += ['/bootdisk/api/']
    end

    initializer 'foreman_bootdisk.register_plugin', before: :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_bootdisk do
        requires_foreman '>= 3.0'

        security_block :bootdisk do |_map|
          permission :download_bootdisk, 'foreman_bootdisk/disks': %i[generic host full_host help],
                                         'foreman_bootdisk/subnet_disks': [:subnet],
                                         'foreman_bootdisk/api/v2/disks': %i[generic host],
                                         'foreman_bootdisk/api/v2/subnet_disks': [:subnet]
        end

        role 'Boot disk access', [:download_bootdisk], 'Role granting permissions to download bootdisks'

        add_all_permissions_to_default_roles

        apipie_documented_controllers ["#{ForemanBootdisk::Engine.root}/app/controllers/foreman_bootdisk/api/v2/*.rb"]
        ApipieDSL.configuration.dsl_classes_matchers += [
          "#{ForemanBootdisk::Engine.root}/app/lib/foreman_bootdisk/scope/*.rb"
        ]
        provision_method 'bootdisk', N_('Boot disk based')
        template_labels 'Bootdisk' => N_('Boot disk embedded template')
        allowed_template_helpers :bootdisk_chain_url, :bootdisk_raise

        extend_page "subnets/index" do |cx|
          cx.add_pagelet :subnet_index_action_buttons, name: 'Bootdisk', partial: 'subnets/bootdisk_action_buttons'
          cx.add_pagelet :subnet_index_title_buttons, name: 'Bootdisk', partial: 'subnets/bootdisk_title_buttons'
        end
      end
    end

    initializer 'foreman_bootdisk.register_gettext', after: :load_config_initializers do |_app|
      locale_dir = File.join(File.expand_path('../..', __dir__), 'locale')
      locale_domain = 'foreman_bootdisk'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end

    config.to_prepare do
      begin
        Host::Managed.prepend ForemanBootdisk::HostExt
        Host::Managed.include ForemanBootdisk::Orchestration::Compute if SETTINGS[:unattended]
        HostsHelper.prepend ForemanBootdisk::HostsHelperExt
        SubnetsHelper.prepend ForemanBootdisk::SubnetsHelperExt
        Foreman::Model::Vmware.prepend ForemanBootdisk::ComputeResources::Vmware if Foreman::Model::Vmware.available?
      rescue StandardError => e
        Rails.logger.warn "#{ForemanBootdisk::ENGINE_NAME}: skipping engine hook (#{e})"
      end
    end
  end

  def self.logger
    Foreman::Logging.logger('foreman_bootdisk')
  end
end
