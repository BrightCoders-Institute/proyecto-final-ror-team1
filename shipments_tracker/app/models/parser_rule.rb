class ParserRule < ApplicationRecord
  validates :code, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :carrier_id, presence: true, numericality: { only_integer: true }, on: :create
  validates :internal_code, presence: true, uniqueness: true

  belongs_to :carrier
end
