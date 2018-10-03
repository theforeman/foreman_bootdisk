# frozen_string_literal: true

kind = TemplateKind.unscoped.where(name: 'Bootdisk').first_or_create

organizations = Organization.all
locations = Location.all
created = []

ProvisioningTemplate.without_auditing do
  content = File.read(File.join(ForemanBootdisk::Engine.root, 'app', 'views', 'foreman_bootdisk', 'host.erb'))
  created << 'Boot disk iPXE - host' unless ProvisioningTemplate.find_by(name: 'Boot disk iPXE - host')
  tmpl = ProvisioningTemplate.unscoped.where(name: 'Boot disk iPXE - host').first_or_create do |template|
    template.attributes = {
      template_kind_id: kind.id,
      snippet: false,
      template: content
    }
  end
  tmpl.attributes = {
    template: content,
    default: true,
    vendor: 'Foreman boot disk'
  }
  tmpl.locked = true
  tmpl.save!(validate: false) if tmpl.changes.present?

  content = File.read(File.join(ForemanBootdisk::Engine.root, 'app', 'views', 'foreman_bootdisk', 'generic_host.erb'))
  created << 'Boot disk iPXE - generic host' unless ProvisioningTemplate.find_by(name: 'Boot disk iPXE - generic host')
  tmpl = ProvisioningTemplate.unscoped.where(name: 'Boot disk iPXE - generic host').first_or_create do |template|
    template.attributes = {
      template_kind_id: kind.id,
      snippet: false,
      template: content
    }
  end
  tmpl.attributes = {
    template: content,
    default: true,
    vendor: 'Foreman boot disk'
  }
  tmpl.locked = true
  tmpl.save!(validate: false) if tmpl.changes.present?

  ProvisioningTemplate.unscoped.where(name: created, default: true).each do |template|
    template.organizations = organizations if SETTINGS[:organizations_enabled]
    template.locations = locations if SETTINGS[:locations_enabled]
  end
end
