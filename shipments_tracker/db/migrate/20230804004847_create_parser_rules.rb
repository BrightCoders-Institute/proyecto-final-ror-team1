class CreateParserRules < ActiveRecord::Migration[7.0]
  def change
    create_table :parser_rules do |t|
      t.string :code
      t.text :description
      t.integer :carrier_id
      t.string :internal_code
      t.timestamps
    end
  end
end
