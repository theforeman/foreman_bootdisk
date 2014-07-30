def format_errors(model = nil)
  return '(nil found)' if model.nil?
  model.errors.full_messages.join(';')
end

kind = TemplateKind.find_or_create_by_name('Bootdisk')

ConfigTemplate.without_auditing do
  content = File.read(File.join(Bootdisk::Engine.root, 'app', 'views', 'bootdisk', 'host.erb'))
  ConfigTemplate.find_or_create_by_name(
    :name => 'Boot disk iPXE - host',
    :template_kind_id => kind.id,
    :snippet => false,
    :template => content
  ).update_attributes(:template => content,
                      :default  => true,
                      :vendor   => "Foreman boot disk",
                      :locked   => true)

  content = File.read(File.join(Bootdisk::Engine.root, 'app', 'views', 'bootdisk', 'generic_host.erb'))
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
