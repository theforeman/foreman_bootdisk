class CreateKickstartBootdiskTemplate < ActiveRecord::Migration
  def self.up
    ConfigTemplate.find_or_create_by_name(
      :name => 'Kickstart boot disk gPXE',
      :template_kind_id => TemplateKind.find_by_name('gPXE').try(:id),
      :template => File.read(File.join(Bootdisk::Engine.root, 'app', 'views', 'bootdisk', 'kickstart_v1.erb'))
    )
  end

  def self.down
    ConfigTemplate.destroy_all(:name => 'Kickstart boot disk gPXE')
  end
end
