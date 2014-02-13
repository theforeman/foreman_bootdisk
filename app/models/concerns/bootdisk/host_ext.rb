module Bootdisk::HostExt
  extend ActiveSupport::Concerns

  def bootdisk_template
    ConfigTemplate.find_by_name(Setting[:bootdisk_host_template]) || raise(::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_host_template'))
  end

  def bootdisk_template_render
    # Waiting on additional whitelisted items, #2948
    Setting[:safemode_render] && raise(::Foreman::Exception.new(N_('Bootdisk is not supported with safemode rendering, please disable safemode_render under Adminster>Settings')))

    @host = self
    pxe_render(bootdisk_template.template)
  end
end
