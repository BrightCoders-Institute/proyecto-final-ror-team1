# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :company_name
      t.boolean :active

      t.timestamps
    end
  end
end
