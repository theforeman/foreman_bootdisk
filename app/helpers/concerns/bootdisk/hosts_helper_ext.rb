module Bootdisk::HostsHelperExt
  extend ActiveSupport::Concern

  included do
    alias_method_chain :host_title_actions, :bootdisk
  end

  def host_title_actions_with_bootdisk(host, vm)
    title_actions(
      button_group(
        select_action_button(_('Boot disk'),
          display_link_if_authorized(_("ISO image"), hash_for_bootdisk_iso_host_path(:id => @host), :class=>'btn'),
          display_link_if_authorized(_("USB image"), hash_for_bootdisk_iso_host_path(:id => @host), :class=>'btn')
        )
      )
    )
    host_title_actions_without_bootdisk(host, vm)
  end

end
