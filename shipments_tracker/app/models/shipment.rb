class Shipment < ApplicationRecord
  # Validación: El campo account_id no puede estar vacío
  validates :account_id, presence: true

  # Validación: El campo status no puede estar vacío y solo puede contener los valore especificados
  validates :status, presence: true, inclusion: { in: %w(REGISTERED IN_TRANSIT DELAYED LOST STOLEN DELIVERED) }

  # Validación: El campo tracking_history no puede estar vacío y debe tener al menos un elemento (longitud mínima de 1)
  validates :tracking_history, presence: true, length: { minimum: 1 }

  # Validación: El campo tracking_number no puede estar vacío y debe ser único en la tabla
  validates :tracking_number, presence: true, uniqueness: true

  belongs_to :account
end
