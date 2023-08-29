# frozen_string_literal: true

class AddCarrierReferenceToShipments < ActiveRecord::Migration[7.0]
  def change
    add_reference :shipments, :carrier, index: true
  end
end
