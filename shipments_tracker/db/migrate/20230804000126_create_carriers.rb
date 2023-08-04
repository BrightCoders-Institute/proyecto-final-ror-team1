class CreateCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :carriers do |t|
      t.string :name,       null: false
      t.string :url,        null: false
      t.string :settings

      t.timestamps
    end
  end
end
