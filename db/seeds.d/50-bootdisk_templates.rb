kind = TemplateKind.find_or_create_by_name('Bootdisk')

ConfigTemplate.without_auditing do
  content = File.read(File.join(ForemanBootdisk::Engine.root, 'app', 'views', 'foreman_bootdisk', 'host.erb'))
  ConfigTemplate.find_or_create_by_name(
    :name => 'Boot disk iPXE - host',
    :template_kind_id => kind.id,
    :snippet => false,
    :template => content
  ).update_attributes(:template => content,
                      :default  => true,
                      :vendor   => "Foreman boot disk",
                      :locked   => true)

  content = File.read(File.join(ForemanBootdisk::Engine.root, 'app', 'views', 'foreman_bootdisk', 'generic_host.erb'))
  ConfigTemplate.find_or_create_by_name(
    :name => 'Boot disk iPXE - generic host',
    :template_kind_id => kind.id,
    :snippet => false,
    :template => content
  ).update_attributes(:template => content,
                      :default  => true,
                      :vendor   => "Foreman boot disk",
                      :locked   => true)
end
