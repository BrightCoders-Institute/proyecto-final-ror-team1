# frozen_string_literal: true

class Shipment < ApplicationRecord
  STATUSES = %w[REGISTERED IN_TRANSIT DELAYED LOST STOLEN DELIVERED].freeze
  # Validación: El campo account_id no puede estar vacío
  validates :account_id, presence: true

  # Validación: El campo status no puede estar vacío y solo puede contener los valore especificados
  validates :status, presence: true, inclusion: { in: STATUSES }

  # Validación: El campo tracking_number no puede estar vacío y debe ser único en la tabla
  validates :tracking_number, presence: true, uniqueness: true

  belongs_to :account
  belongs_to :carrier

  tracking_shipment after: :create

  def tracking_shipment
    #call service to tracking
  end
end
