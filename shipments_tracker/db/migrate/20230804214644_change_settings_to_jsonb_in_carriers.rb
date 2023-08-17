# frozen_string_literal: true

class ChangeSettingsToJsonbInCarriers < ActiveRecord::Migration[7.0]
  def up
    change_column :carriers, :settings, :jsonb, using: 'settings::jsonb'
  end

  def down
    change_column :carriers, :settings, :string
  end
end
