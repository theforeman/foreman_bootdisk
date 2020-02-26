# frozen_string_literal: true

require 'foreman_bootdisk'
require 'fast_gettext'
require 'gettext_i18n_rails'

module ForemanBootdisk
  class Engine < ::Rails::Engine
    engine_name 'foreman_bootdisk'
    isolate_namespace ForemanBootdisk

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/lib"]

    initializer 'foreman_bootdisk.mount_engine' do |app|
      app.routes_reloader.paths << "#{ForemanBootdisk::Engine.root}/config/routes/mount_engine.rb"
    end

    initializer 'foreman_bootdisk.load_app_instance_data' do |app|
      ForemanBootdisk::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_bootdisk.apipie' do
      Apipie.configuration.checksum_path += ['/bootdisk/api/']
    end

    # Temporary workaround fix for helpers
    initializer 'foreman_bootdisk.rails_loading_workaround' do
      HostsHelper.prepend ForemanBootdisk::HostsHelperExt
      SubnetsHelper.include ForemanBootdisk::SubnetsHelperExt
    end

    initializer 'foreman_bootdisk.register_plugin', before: :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_bootdisk do
        requires_foreman '>= 3.7'
        # Add Global files for extending foreman-core components and routes
        register_global_js_file 'global'
        register_gettext

        security_block :bootdisk do |_map|
          permission :download_bootdisk, 'foreman_bootdisk/disks': %i[generic host full_host help bootdisk_options],
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
        allowed_template_helpers :bootdisk_chain_url, :bootdisk_raise

        extend_page "subnets/index" do |cx|
          cx.add_pagelet :subnet_index_action_buttons, name: 'Bootdisk', partial: 'subnets/bootdisk_action_buttons'
          cx.add_pagelet :subnet_index_title_buttons, name: 'Bootdisk', partial: 'subnets/bootdisk_title_buttons'
        end

        settings do
          category :bootdisk, N_("Boot disk") do
            ipxe = ['/usr/lib/ipxe'].find { |p| File.exist?(p) } || '/usr/share/ipxe'
            isolinux = ['/usr/lib/ISOLINUX'].find { |p| File.exist?(p) } || '/usr/share/syslinux'
            syslinux = ['/usr/lib/syslinux/modules/bios', '/usr/lib/syslinux'].find { |p| File.exist?(p) } || '/usr/share/syslinux'
            grub2 = ['/var/lib/tftpboot/grub2'].find { |p| File.exist?(p) } || '/var/lib/foreman/bootdisk'
            templates = -> {
              Hash[ProvisioningTemplate.where(template_kind: TemplateKind.where(name: 'Bootdisk')).map { |temp| [temp[:name], temp[:name]] }]
            }

            setting "bootdisk_ipxe_dir",
              type: :string,
              default: ipxe,
              full_name: N_("iPXE directory"),
              description: N_("Path to directory containing iPXE images")

            setting "bootdisk_isolinux_dir",
              type: :string,
              default: isolinux,
              full_name: N_("ISOLINUX directory"),
              description: N_("Path to directory containing isolinux images")

            setting "bootdisk_syslinux_dir",
              type: :string,
              default: syslinux,
              full_name: N_("SYSLINUX directory"),
              description: N_("Path to directory containing syslinux images")

            setting "bootdisk_grub2_dir",
              type: :string,
              default: grub2,
              full_name: N_("Grub2 directory"),
              description: N_("Path to directory containing grubx64.efi and shimx64.efi")

            setting "bootdisk_host_template",
              type: :string,
              collection: templates,
              default: "Boot disk iPXE - host",
              full_name: N_("Host image template"),
              description: N_("iPXE template to use for host-specific boot disks")

            setting "bootdisk_generic_host_template",
              type: :string,
              collection: templates,
              default: "Boot disk iPXE - generic host",
              full_name: N_("Generic image template"),
              description: N_("iPXE template to use for generic host boot disks")

            setting "bootdisk_generic_efi_host_template",
              type: :string,
              collection: templates,
              default: "Boot disk Grub2 EFI - generic host",
              full_name: N_("Generic Grub2 EFI image template"),
              description: N_("iPXE template to use for generic EFI host boot disks")

            setting "bootdisk_mkiso_command",
              type: :string,
              default: "genisoimage",
              full_name: N_("ISO generation command"),
              description: N_("Command to generate ISO image, use genisoimage or mkisofs")

            setting "bootdisk_cache_media",
              type: :boolean,
              default: true,
              full_name: N_("Installation media caching"),
              description: N_("Installation media files will be cached for full host images")

            setting "bootdisk_allowed_types",
              type: :array,
              default: Setting::Bootdisk.bootdisk_types,
              full_name: N_("Allowed bootdisk types"),
              description: N_("List of allowed bootdisk types, remove type to disable it")
          end
        end
      end
    end

    config.to_prepare do
      begin
        Host::Managed.prepend ForemanBootdisk::HostExt
        Host::Managed.include ForemanBootdisk::Orchestration::Compute
        Foreman::Model::Vmware.prepend ForemanBootdisk::ComputeResources::Vmware if Foreman::Model::Vmware.available?
        ForemanFogProxmox::Proxmox.prepend ForemanBootdisk::ComputeResources::Proxmox if ForemanBootdisk.with_proxmox?
      rescue StandardError => e
        Rails.logger.warn "#{ForemanBootdisk::ENGINE_NAME}: skipping engine hook (#{e})"
      end
    end
  end

  def self.logger
    Foreman::Logging.logger('foreman_bootdisk')
  end

  def self.with_proxmox?
    Foreman::Plugin.installed?('foreman_fog_proxmox')
  end
end
