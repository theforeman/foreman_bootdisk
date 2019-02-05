# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  class Renderer
    def generic_template_render(subnet = nil)
      host = if subnet.present?
               # rendering a subnet-level bootdisk requires tricking the renderer into thinking it has a
               # valid host, without a token, but with a tftp proxy
               Struct.new(:token, :provision_interface).new(
                 nil,
                 Struct.new(:subnet).new(subnet)
               )
             else
               Struct.new(:token, :subnet, :content_source).new(nil, nil, nil)
             end

      render_template(template: generic_host_template, host: host)
    end

    def render_template(template:, host:, scope_class: renderer_scope)
      source = Foreman::Renderer.get_source(
        template: template,
        host: host
      )
      scope = Foreman::Renderer.get_scope(
        host: host,
        klass: scope_class
      )
      Foreman::Renderer.render(source, scope)
    end

    private

    def renderer_scope
      ForemanBootdisk::Scope::Bootdisk
    end

    def generic_host_template
      template = ProvisioningTemplate.unscoped.find_by(name: Setting[:bootdisk_generic_host_template])
      raise ::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_generic_host_template') unless template

      template
    end
  end
end
