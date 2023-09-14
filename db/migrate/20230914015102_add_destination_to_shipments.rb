class AddDestinationToShipments < ActiveRecord::Migration[7.0]
  def change
    add_column :shipments, :destination, :string
  end
end
