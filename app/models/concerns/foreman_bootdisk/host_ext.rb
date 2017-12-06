require 'uri'

module ForemanBootdisk::HostExt
  extend ActiveSupport::Concern

  included do
    alias_method_chain :validate_media?, :bootdisk
    alias_method_chain :can_be_built?, :bootdisk
  end

  def bootdisk_template
    ProvisioningTemplate.unscoped.find_by_name(Setting[:bootdisk_host_template]) || raise(::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_host_template'))
  end

  def bootdisk_template_render
    @host = self
    unattended_render(bootdisk_template.template)
  end

  def bootdisk_chain_url(mac = self.mac, action = 'iPXE')
    ForemanBootdisk::Renderer.format_bootdisk_chain_url(foreman_url(action), mac)
  end

  def bootdisk_raise(*args)
    raise ::Foreman::Exception.new(*args)
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

  def validate_media_with_bootdisk?
    validate_media_without_bootdisk? || (managed && bootdisk_build? && build?)
  end

  def can_be_built_with_bootdisk?
    can_be_built_without_bootdisk? || (managed? and SETTINGS[:unattended] and bootdisk_build? and !build?)
  end
end
