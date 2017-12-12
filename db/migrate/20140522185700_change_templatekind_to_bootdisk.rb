class ChangeTemplatekindToBootdisk < ActiveRecord::Migration[4.2]
  class FakeConfigTemplate < ActiveRecord::Base
    if ActiveRecord::Migrator.get_all_versions.include?(20150514072626)
      self.table_name = 'templates'
    else
      self.table_name = 'config_templates'
    end
  end

  def self.up
    kind = TemplateKind.where(:name => 'Bootdisk').first_or_create

    tmpl_h = Setting.find_by_name('bootdisk_host_template').try(:value)
    tmpl_g = Setting.find_by_name('bootdisk_generic_host_template').try(:value)

    (FakeConfigTemplate.unscoped.where('name LIKE ?', '%Boot disk%') |
      FakeConfigTemplate.unscoped.where(:name => [tmpl_h, tmpl_g].compact)).each do |tmpl|
      tmpl.update_attribute(:template_kind_id, kind.id)
    end
  end

  def self.down
    old_kind = TemplateKind.find_by_name('Bootdisk')
    new_kind = TemplateKind.find_by_name('iPXE')
    if old_kind.present? && new_kind.present?
      FakeConfigTemplate.unscoped.where(:template_kind_id => old_kind.id).update_all(:template_kind_id => new_kind.id)
    end
  end
end
