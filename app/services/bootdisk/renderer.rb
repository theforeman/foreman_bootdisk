module Bootdisk
  class Renderer
    include ::Foreman::Renderer
    include Rails.application.routes.url_helpers

    def generic_template_render
      # Waiting on additional whitelisted items, #2948
      Setting[:safemode_render] && raise(::Foreman::Exception.new(N_('Bootdisk is not supported with safemode rendering, please disable safemode_render under Adminster>Settings')))

      tmpl = ConfigTemplate.find_by_name(Setting[:bootdisk_generic_host_template]) || raise(::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_generic_host_template'))
      @host = Struct.new(:token).new(nil)
      unattended_render(tmpl.template)
    end
  end
end
