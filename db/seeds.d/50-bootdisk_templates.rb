# frozen_string_literal: true

def read_bootdisk_template(filename)
  File.read(File.join(ForemanBootdisk::Engine.root, 'app', 'views', 'foreman_bootdisk', filename))
end

def ensure_bootdisk_template(name, content)
  kind = TemplateKind.unscoped.where(name: 'Bootdisk').first_or_create
  tmpl = ProvisioningTemplate.unscoped.where(name: name).first_or_create do |template|
    template.attributes = {
      template_kind_id: kind.id,
      snippet: false,
      template: content
    }
  end
  tmpl.attributes = {
    template: content,
    default: true,
    vendor: "Foreman boot disk"
  }
  tmpl.locked = true
  tmpl.organizations = Organization.unscoped.all if SETTINGS[:organizations_enabled]
  tmpl.locations = Location.unscoped.all if SETTINGS[:locations_enabled]
  tmpl.save!(validate: false) if tmpl.changes.present?
end

ProvisioningTemplate.without_auditing do
  ensure_bootdisk_template("Boot disk iPXE - host", read_bootdisk_template("host.erb"))
  ensure_bootdisk_template("Boot disk iPXE - generic host", read_bootdisk_template("generic_host.erb"))
  ensure_bootdisk_template("Boot disk Grub2 EFI - generic host", read_bootdisk_template("generic_efi_host.erb"))
  ensure_bootdisk_template("Boot disk iPXE - generic static host", read_bootdisk_template("generic_static_host.erb"))
end
