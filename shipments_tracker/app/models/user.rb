class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    # Ensures that the account_id field is present (not empty).
    validates :id, presence: true

    # Ensures that the email field is present, unique, and has a valid email address format.
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

    # Ensures that the role field is present and only accepts the values 'admin', 'owner', or 'staff'.
    validates :role, presence: true, inclusion: { in: %w(admin owner staff) }

    # Ensures that the account_id field is present (not empty).
    validates :account_id, presence: true
end
