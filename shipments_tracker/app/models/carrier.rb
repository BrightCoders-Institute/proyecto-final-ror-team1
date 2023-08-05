class Carrier < ApplicationRecord
  # Ensures that the account_id field is present (not empty).
  validates :name, presence: true
  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: -> {url.present?}
  has_many :parser_rules

  attr_accessor :settings
end
