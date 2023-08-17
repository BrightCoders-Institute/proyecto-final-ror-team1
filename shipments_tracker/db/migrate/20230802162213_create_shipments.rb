# frozen_string_literal: true

class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :account
      t.string :status
      t.string :tracking_history, array: true, default: []
      t.string :tracking_number

      t.timestamps null: false
    end

    add_index :shipments, :id, unique: true
    add_index :shipments, :tracking_number
  end
end
