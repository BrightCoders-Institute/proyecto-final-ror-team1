class Carrier < ApplicationRecord
  # Ensures that the account_id field is present (not empty).
  validates :id, presence: true
  validates :name, presence: true

  validates :url, presence: true
  validates :url, format: { with: URI.regexp }, if: -> {url.present?}

  attr_accessor :settings
end
