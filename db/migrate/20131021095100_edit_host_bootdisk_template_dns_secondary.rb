class EditHostBootdiskTemplateDnsSecondary < ActiveRecord::Migration
  def self.up
    ConfigTemplate.find_by_name('Boot disk gPXE - host').update_attribute(
      :template, File.read(File.join(Bootdisk::Engine.root, 'app', 'views', 'bootdisk', 'host_v3.erb')))
  end

  def self.down
    ConfigTemplate.find_by_name('Boot disk gPXE - host').update_attribute(
      :template, File.read(File.join(Bootdisk::Engine.root, 'app', 'views', 'bootdisk', 'host_v2.erb')))
  end
end
