class CreateKickstartBootdiskTemplate < ActiveRecord::Migration
  def self.up
  end

  def self.down
    ConfigTemplate.destroy_all(:name => 'Kickstart boot disk gPXE')
  end
end
