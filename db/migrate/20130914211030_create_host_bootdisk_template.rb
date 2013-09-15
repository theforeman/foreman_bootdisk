class CreateHostBootdiskTemplate < ActiveRecord::Migration
  def self.up
    ConfigTemplate.find_or_create_by_name(
      :name => 'Boot disk gPXE - host',
      :template_kind_id => TemplateKind.find_by_name('gPXE').try(:id),
      :snippet => false,
      :template => File.read(File.join(Bootdisk::Engine.root, 'app', 'views', 'bootdisk', 'host_v1.erb'))
    )
  end
  
  def self.down
    ConfigTemplate.destroy_all(:name => 'Boot disk gPXE - host')
  end
end
