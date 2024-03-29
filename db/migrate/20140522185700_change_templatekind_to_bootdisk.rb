# frozen_string_literal: true

class ChangeTemplatekindToBootdisk < ActiveRecord::Migration[4.2]
  class FakeConfigTemplate < ApplicationRecord
    self.table_name = if ActiveRecord::Base.connection.data_source_exists?("config_templates")
                        'config_templates'
                      else
                        'templates'
                      end
    self.inheritance_column = :_type_disabled
  end

  def self.up
    kind = TemplateKind.where(name: 'Bootdisk').first_or_create

    tmpl_h = Setting.find_by(name: 'bootdisk_host_template').try(:value)
    tmpl_g = Setting.find_by(name: 'bootdisk_generic_host_template').try(:value)

    FakeConfigTemplate.unscoped.where('name LIKE ?', '%Boot disk%').update_all(template_kind_id: kind.id)
    FakeConfigTemplate.unscoped.where(name: [tmpl_h, tmpl_g].compact).update_all(template_kind_id: kind.id)
  end

  def self.down
    old_kind = TemplateKind.find_by(name: 'Bootdisk')
    new_kind = TemplateKind.find_by(name: 'iPXE')
    return unless old_kind.present? && new_kind.present?

    FakeConfigTemplate.unscoped.where(template_kind_id: old_kind.id).update_all(template_kind_id: new_kind.id)
  end
end
