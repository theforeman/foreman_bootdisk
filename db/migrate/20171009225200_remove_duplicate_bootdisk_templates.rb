class RemoveDuplicateBootdiskTemplates < ActiveRecord::Migration
  def up
    template_names = ['Boot disk iPXE - host', 'Boot disk iPXE - generic host']
    template_names.each do |template_name|
      duplicate_template_ids = ProvisioningTemplate.unscoped.where(:name => template_name, :locked => true).order(:created_at => :asc).pluck(:id).drop(1)
      ProvisioningTemplate.unscoped.where(:id => duplicate_template_ids).destroy_all if duplicate_template_ids.any?
    end
  end
end
