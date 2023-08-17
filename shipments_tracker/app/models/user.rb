# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Ensures that the email field is present, unique, and has a valid email address format.
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, allow_blank: false

  # Ensures that the role field is present and only accepts the values 'admin', 'owner', or 'staff'.
  validates :role, presence: true, inclusion: { in: %w[admin owner staff] }

  belongs_to :account, optional: true

  after_create :onboard_account

  def onboard_account
    update(account_id: Account.create!(company_name: 'Bridgecoders'))
  end
end
