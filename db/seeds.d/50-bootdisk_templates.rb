kind = TemplateKind.where(:name => 'Bootdisk').first_or_create

ProvisioningTemplate.without_auditing do
  content = File.read(File.join(ForemanBootdisk::Engine.root, 'app', 'views', 'foreman_bootdisk', 'host.erb'))
  tmpl = ProvisioningTemplate.where(:name => 'Boot disk iPXE - host').first_or_create do |template|
    template.attributes = {
      :template_kind_id => kind.id,
      :snippet => false,
      :template => content
    }
  end
  tmpl.attributes = {
    :template => content,
    :default  => true,
    :vendor   => "Foreman boot disk",
  }
  tmpl.locked = true
  tmpl.save!(:validate => false) if tmpl.changes.present?

  content = File.read(File.join(ForemanBootdisk::Engine.root, 'app', 'views', 'foreman_bootdisk', 'generic_host.erb'))
  tmpl = ProvisioningTemplate.where(:name => 'Boot disk iPXE - generic host').first_or_create do |template|
    template.attributes = {
      :template_kind_id => kind.id,
      :snippet => false,
      :template => content
    }
  end
  tmpl.attributes = {
    :template => content,
    :default  => true,
    :vendor   => "Foreman boot disk",
  }
  tmpl.locked = true
  tmpl.save!(:validate => false) if tmpl.changes.present?
end
