require 'uri'

module ForemanBootdisk
  class Renderer
    include ::Foreman::Renderer
    include Rails.application.routes.url_helpers
    delegate :logger, :to => :ForemanBootdisk

    def generic_template_render(subnet = nil)
      tmpl = ProvisioningTemplate.find_by_name(Setting[:bootdisk_generic_host_template]) || raise(::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_generic_host_template'))

      if subnet.present?
        # rendering a subnet-level bootdisk requires tricking the renderer into thinking it has a
        # valid host, with a token, and with a tftp proxy
        @host = Struct.new(:token, :subnet).new(
          Struct.new(:value).new('faketoken'),
          subnet
        )
      else
        @host = Struct.new(:token, :subnet).new(nil,nil)
      end
      modified_template = unattended_render(tmpl.template)
      # remove the token from subnet-level generation, since this is meant to be generic
      modified_template.gsub!(/(?<=iPXE\?)token=faketoken\&(?=mac=)/,'')
      modified_template
    end

    def bootdisk_chain_url(mac = '', action = 'iPXE')
      Renderer.format_bootdisk_chain_url(foreman_url(action), mac)
    end

    def self.format_bootdisk_chain_url(url, mac)
      u = URI.parse(url)
      ForemanBootdisk.logger.warn("Foreman or proxy is configured with HTTPS, probably not supported by iPXE: #{u}") if u.scheme == 'https'
      u.query = "#{u.query}&mac=#{mac}"
      u.fragment = nil
      u.to_s
    end
  end
end
