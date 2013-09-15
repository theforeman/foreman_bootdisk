# Make templates supplied by the plugin read-only so they can be safely
# replaced during DB migrations.
module Bootdisk::ConfigTemplateExt
  extend ActiveSupport::Concern

  included do
    before_destroy :bootdisk_destroy?
    validate :bootdisk_readonly
  end

  def bootdisk_destroy?
    bootdisk_readonly
    errors.empty?
  end

  def bootdisk_readonly
    if ['Boot disk gPXE - host'].include? name_was
      errors.add(:base, _("Template is read-only as it's supplied in foreman_bootdisk.  Please copy it to a new template to customize."))
    end
  end
end
