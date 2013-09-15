class CreateGenericHostBootdiskTemplate < ActiveRecord::Migration
  def self.up
    ConfigTemplate.find_or_create_by_name(
      :name => 'Boot disk gPXE - generic host',
      :template_kind_id => TemplateKind.find_by_name('gPXE').try(:id),
      :snippet => false,
      :template => File.read(File.join(Bootdisk::Engine.root, 'app', 'views', 'bootdisk', 'generic_host_v1.erb'))
    )
  end
  
  def self.down
    ConfigTemplate.destroy_all(:name => 'Boot disk gPXE - generic host')
  end
end
