require 'uri'

module ForemanBootdisk
  class Renderer
    include ::Foreman::Renderer
    include Rails.application.routes.url_helpers

    def generic_template_render
      if (Gem::Version.new(SETTINGS[:version].notag) < Gem::Version.new('1.5')) && Setting[:safemode_render]
        raise(::Foreman::Exception.new(N_('Bootdisk is not supported with safemode rendering, please disable safemode_render under Adminster>Settings')))
      end

      tmpl = ConfigTemplate.find_by_name(Setting[:bootdisk_generic_host_template]) || raise(::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_generic_host_template'))
      @host = Struct.new(:token, :subnet).new(nil, nil)
      unattended_render(tmpl.template)
    end

    def bootdisk_chain_url(action = 'iPXE')
      u = URI.parse(foreman_url(action))
      u.query = "#{u.query}&mac="
      u.fragment = nil
      u.to_s
    end
  end
end
