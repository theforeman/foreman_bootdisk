# frozen_string_literal: true

module BootdiskLinksHelper
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

  def divider
    tag(:li, class: 'divider')
  end

  def bootdisk_help_link
    display_bootdisk_link_if_authorized(
      _('Boot disk Help'),
    {
        controller: 'foreman_bootdisk/disks',
        action: 'help'
      },
      class: 'la'
    )
  end

  def bootdisk_title_action_buttons(actions)
    title_actions(
      button_group(
        select_action_button(
          _('Boot disk'), { class: 'btn btn-group' },
          actions
        )
      )
    )
  end
end
