# frozen_string_literal: true

class Setting
  class Bootdisk
    def self.humanized_category
      N_('Boot disk')
    end

    def self.bootdisk_types
      %w(generic host full_host subnet)
    end

    def self.allowed_types
      Setting['bootdisk_allowed_types']
    end
  end
end
