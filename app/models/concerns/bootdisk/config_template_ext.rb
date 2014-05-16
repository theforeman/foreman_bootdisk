# Make templates supplied by the plugin read-only so they can be safely
# replaced during DB migrations.
module Bootdisk::ConfigTemplateExt
  extend ActiveSupport::Concern

  BOOTDISK_TMPLS = ['Boot disk iPXE - host', 'Boot disk iPXE - generic host']

  included do
    before_destroy :bootdisk_destroy?
    validate :bootdisk_readonly
  end

  def bootdisk_destroy?
    return true if ARGV.find { |a| a.start_with? "db:migrate" }
    if BOOTDISK_TMPLS.include?(name)
      bootdisk_add_error
      false
    else
      true
    end
  end

  def bootdisk_readonly
    c = changes

    # ignore CRLF changes
    if c['template'] && (c['template'][0].nil? || c['template'][0].gsub("\n", "\r\n") == c['template'][1])
      c.delete 'template'
    end

    # ignore nil to false changes
    c.delete 'snippet' if c['snippet'] == [nil, false]

    # allow the user to associate it, just not change the content
    other_attrs = c.keys.find { |f| !['template_combinations', 'template_associations'].include? f }
    bootdisk_add_error if BOOTDISK_TMPLS.include?(name_was) && other_attrs
  end

  def bootdisk_add_error
    errors.add(:base, _("Template is read-only as it's supplied in foreman_bootdisk.  Please copy it to a new template to customize."))
  end
end
