# frozen_string_literal: true

class ParserRule < ApplicationRecord
  validates :code, presence: true, length: { maximum: 50 }
  validates :carrier_id, presence: true, numericality: { only_integer: true }, on: :create

  belongs_to :carrier
end
