# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  class Renderer
    def render_template(template:, host:, scope_class: renderer_scope, subnet: nil)
      source = Foreman::Renderer.get_source(
        template: template,
      )
      scope = Foreman::Renderer.get_scope(
        host: host,
        variables: { subnet: subnet, bootdisk: true },
        klass: scope_class,
      )
      Foreman::Renderer.render(source, scope)
    end

    def generic_template_render(subnet = nil)
      render_template(template: generic_host_template, host: stub_host(subnet), subnet: subnet)
    end

    def generic_efi_template_render(subnet)
      if subnet.httpboot?
        render_template(template: generic_efi_host_template, host: stub_host(subnet), subnet: subnet)
      else
        ForemanBootdisk.logger.warn('HTTPBOOT feature is not enabled for subnet %s, UEFI may not be available for bootdisk' % subnet.name)
      end
    end

    private

    def stub_host(subnet)
      if subnet.present?
        # rendering a subnet-level bootdisk requires tricking the renderer into thinking it has a
        # valid host, without a token, but with a tftp proxy
        Struct.new(:token, :provision_interface, :content_source).new(
          nil,
          Struct.new(:subnet).new(subnet),
          nil
        )
      else
        Struct.new(:token, :subnet, :content_source).new(nil, nil, nil)
      end
    end

    def renderer_scope
      ForemanBootdisk::Scope::Bootdisk
    end

    def generic_host_template
      template = ProvisioningTemplate.unscoped.find_by(name: Setting[:bootdisk_generic_host_template])
      raise ::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_generic_host_template') unless template

      template
    end

    def generic_efi_host_template
      template = ProvisioningTemplate.unscoped.find_by(name: Setting[:bootdisk_generic_efi_host_template])
      raise ::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_generic_efi_host_template') unless template

      template
    end
  end
end
