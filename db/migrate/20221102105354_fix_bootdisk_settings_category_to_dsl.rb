# frozen_string_literal: true

class FixBootdiskSettingsCategoryToDsl < ActiveRecord::Migration[6.0]
  def up
    Setting.where(category: 'Setting::Bootdisk').update_all(category: 'Setting')
  end
end
