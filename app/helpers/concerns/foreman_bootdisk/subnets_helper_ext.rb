# frozen_string_literal: true

module ForemanBootdisk
  module SubnetsHelperExt
    include BootdiskLinksHelper

    def display_bootdisk_for_subnet(subnet)
      if (proxy = subnet.tftp || subnet.httpboot) && proxy.has_feature?('Templates') && Setting::Bootdisk.allowed_types.include?('subnet')
        display_bootdisk_link_if_authorized(
            _("Subnet generic image"), {
            controller: 'foreman_bootdisk/subnet_disks',
            action: 'subnet',
            id: subnet.id
        },
            class: 'la'
        )
      else
        ''
      end
    end

    def display_bootdisk_title_buttons

      actions = []

      generic_image_link = display_bootdisk_link_if_authorized(
                             _('Generic image'),
                           {
                               controller: 'foreman_bootdisk/disks',
                               action: 'generic'
                             },
                             class: 'la'
                           )

      if Setting::Bootdisk.allowed_types&.include?('generic')
        actions << generic_image_link
        actions << divider
      end

      actions << bootdisk_help_link

      bootdisk_title_action_buttons(actions)
    end
  end
end
