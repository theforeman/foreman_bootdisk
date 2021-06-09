# frozen_string_literal: true

module DiskHelper
  def mark_disabled_bootdisk_type(type)
    return '' if Setting::Bootdisk.allowed_types&.include?(type)
    '*'
  end
end
