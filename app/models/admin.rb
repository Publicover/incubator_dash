class Admin < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  # has_many :students
  validates :name, :password_digest, :flavor, presence: true
  validates :email, presence: true, format: { with: /@/, message: "Must be email address."},
                    length: { in: 8..250 }
end
