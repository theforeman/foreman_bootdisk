# frozen_string_literal: true

module ForemanBootdisk
  module HostsHelperExt
    include BootdiskLinksHelper

    def host_title_actions(host)
      if host.bootdisk_downloadable?
        bootdisk_title_action_buttons(host_action_buttons(host))
      else
        bootdisk_button_disabled(host)
      end

      super
    end

    def bootdisk_button_disabled(host)
      title_actions(
        button_group(
          link_to(_('Boot disk'), '#', disabled: true, class: 'btn btn-default',
                                       title: _('Boot disk download not available for %s architecture') % host.architecture.name)
        )
      )
    end

    # need to wrap this one in a test for template proxy presence
    def display_bootdisk_for_subnet(host)
      if (proxy = host.try(:subnet).try(:tftp) || host.try(:subnet).try(:httpboot)) && proxy.has_feature?('Templates')
        display_bootdisk_link_if_authorized(
          _("Subnet '%s' generic image") % host.subnet.name, {
            controller: 'foreman_bootdisk/disks',
            action: 'subnet',
            id: host
          },
          class: 'la'
        )
      else
        ''
      end
    end

    # Core Foreman helpers can't look up a URL against a mounted engine
    def display_bootdisk_link_if_authorized(name, options = {}, html_options = {})
      if bootdisk_authorized_for(options)
        link_to(name, bootdisk_url(options), html_options)
      else
        ''
      end
    end

    def bootdisk_url(options)
      ForemanBootdisk::Engine.routes.url_for(options.merge(only_path: true, script_name: foreman_bootdisk_path))
    end

    def bootdisk_authorized_for(options)
      User.current.allowed_to?(options)
    end

    def host_action_buttons(host)
      actions = []

      allowed_actions = Setting::Bootdisk.allowed_types
      return '' unless allowed_actions

      host_image_link = display_bootdisk_link_if_authorized(
                          _("Host '%s' image") % host.name.split('.')[0],
                        {
                            controller: 'foreman_bootdisk/disks',
                            action: 'host',
                            id: host
                          },
                          class: 'la'
                        )

      full_host_image_link = display_bootdisk_link_if_authorized(
                               _("Full host '%s' image") % host.name.split('.')[0],
                             {
                                 controller: 'foreman_bootdisk/disks',
                                 action: 'full_host',
                                 id: host
                               },
                               class: 'la'
                             )

      full_host_blind_link = if bootdisk_authorized_for({controller: 'foreman_bootdisk/disks', action: 'full_host', id: host})
                               link_to(_("Full host '%s' image") % host.name.split('.')[0],
                                       '#',
                                       class: 'la btn btn-info',
                                       disabled: true,
                                       title: _('Host is not in build mode')
                               )
                             else
                               ''
                             end

      actions << host_image_link if allowed_actions.include?('host')
      if allowed_actions.include?('full_host')
        if host.build?
          actions << full_host_image_link
        else
          actions << full_host_blind_link
        end
      end


      actions << divider if (host_image_link.present? && allowed_actions.include?('host')) || (full_host_image_link.present? && allowed_actions.include?('full_host'))

      actions << bootdisk_help_link

      actions
    end
  end
end
