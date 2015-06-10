class ChangeTemplatekindToBootdisk < ActiveRecord::Migration
  class ConfigTemplate < ActiveRecord::Base; end

  def self.up
    kind = TemplateKind.find_or_create_by_name('Bootdisk')

    tmpl_h = Setting.find_by_name('bootdisk_host_template').try(:value)
    tmpl_g = Setting.find_by_name('bootdisk_generic_host_template').try(:value)

    (ConfigTemplate.unscoped.where('name LIKE ?', '%Boot disk%') |
      ConfigTemplate.unscoped.where(:name => [tmpl_h, tmpl_g].compact)).each do |tmpl|
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
