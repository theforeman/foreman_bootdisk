module ForemanBootdisk::HostsHelperExt
  extend ActiveSupport::Concern

  included do
    alias_method_chain :host_title_actions, :bootdisk
  end

  def host_title_actions_with_bootdisk(*args)
    title_actions(
      button_group(
        select_action_button(_('Boot disk'), {},
          display_bootdisk_link_if_authorized(_("Host '%s' image") % @host.name.split('.')[0], {:controller => 'foreman_bootdisk/disks', :action => 'host', :id => @host}, :class=>'btn'),
          display_bootdisk_link_if_authorized(_("Generic image"), {:controller => 'foreman_bootdisk/disks', :action => 'generic'}, :class=>'btn')
        )
      )
    )
    host_title_actions_without_bootdisk(*args)
  end

  # Core Foreman helpers can't look up a URL against a mounted engine
  def display_bootdisk_link_if_authorized(name, options = {}, html_options = {})
    if bootdisk_authorized_for(options)
      link_to(name, bootdisk_url(options), html_options)
    else
      ""
    end
  end

  def bootdisk_url(options)
    ForemanBootdisk::Engine.routes.url_for(options.merge(:only_path => true))
  end

  def bootdisk_authorized_for(options)
    User.current.allowed_to?(options)
  end
end
