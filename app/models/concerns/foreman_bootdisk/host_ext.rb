require 'uri'

module ForemanBootdisk::HostExt
  def bootdisk_template
    ProvisioningTemplate.unscoped.find_by_name(Setting[:bootdisk_host_template]) || raise(::Foreman::Exception.new(N_('Unable to find template specified by %s setting'), 'bootdisk_host_template'))
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

  def validate_media?
    super || (managed && bootdisk_build? && build?)
  end

  def can_be_built?
    super || (managed? and SETTINGS[:unattended] and bootdisk_build? and !build?)
  end
end
