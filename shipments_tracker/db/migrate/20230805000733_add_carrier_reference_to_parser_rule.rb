class AddCarrierReferenceToParserRule < ActiveRecord::Migration[7.0]
  def up
    remove_column :parser_rules, :carrier_id
    add_reference :parser_rules, :carrier, index: true
  end

  def down
    remove_reference :parser_rules, :carrier, index: true
    add_column :parser_rules, :carrier_id, :integer
  end
end
