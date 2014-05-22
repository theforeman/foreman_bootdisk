class ChangeTemplatekindToBootdisk < ActiveRecord::Migration
  def self.up
    kind = TemplateKind.find_or_create_by_name('Bootdisk')
    ConfigTemplate.unscoped.where('name LIKE ? OR name = ? OR name = ?', '%Boot disk%',
        Setting[:bootdisk_host_template], Setting[:bootdisk_generic_host_template]).each do |tmpl|
      tmpl.update_attribute(:template_kind_id, kind.id)
    end
  end

  def self.down
    old_kind = TemplateKind.find_by_name('Bootdisk')
    new_kind = TemplateKind.find_by_name('iPXE')
    if old_kind.present? && new_kind.present?
      ConfigTemplate.unscoped.where(:template_kind_id => old_kind.id).update_all(:template_kind_id => new_kind.id)
    end
  end
end
