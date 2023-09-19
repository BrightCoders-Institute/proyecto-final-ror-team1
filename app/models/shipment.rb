# frozen_string_literal: true

class Shipment < ApplicationRecord
  STATUSES = %w[REGISTERED IN_TRANSIT DELAYED LOST STOLEN DELIVERED].freeze
  # Validación: El campo account_id no puede estar vacío
  validates :account_id, presence: true

  # Validación: El campo status no puede estar vacío y solo puede contener los valore especificados
  validates :status, presence: true, inclusion: { in: STATUSES }, allow_nil: true

  # Validación: El campo tracking_number no puede estar vacío y debe ser único en la tabla
  validates :tracking_number, presence: true, uniqueness: true

  belongs_to :account
  belongs_to :carrier

  after_create :tracking_shipment

  def tracking_shipment
    carrier_name = carrier.name
    new_data = "Carriers::TrackingRequester#{carrier_name.capitalize}".constantize.new(
      tracking_number: tracking_number, carrier_name: carrier_name
    ).call
    update(status: new_data[:status], tracking_history: new_data[:tracking_history],
           destination: new_data[:destination])
  end
end
