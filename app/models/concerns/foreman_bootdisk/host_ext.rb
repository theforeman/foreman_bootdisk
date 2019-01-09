# frozen_string_literal: true

require 'uri'

module ForemanBootdisk
  module HostExt
    def bootdisk_template
      template = ProvisioningTemplate.unscoped.find_by(
        name: Setting[:bootdisk_host_template]
      )
      unless template
        raise ::Foreman::Exception.new(
          N_('Unable to find template specified by %s setting'), 'bootdisk_host_template'
        )
      end
      template
    end

    def bootdisk_template_render
      ForemanBootdisk::Renderer.new.render_template(template: bootdisk_template, host: self)
    end

    def bootdisk_build?
      provision_method == 'bootdisk'
    end

    def bootdisk?
      managed? && bootdisk_build? && SETTINGS[:unattended]
    end

    def bootdisk_downloadable?
      architecture.blank? || intel_arch?
    end

    def intel_arch?
      /i.86|x86[_-]64/ =~ architecture.name
    end

    def can_be_built?
      super || (managed? && SETTINGS[:unattended] && bootdisk_build? && !build?)
    end
  end
end
