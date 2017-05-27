class Student < ApplicationRecord
  has_secure_password
  belongs_to :admin
  has_and_belongs_to_many :assignments
  validates :name, :flavor, presence: true
  validates :email, uniqueness: true, format: { with: /@/, message: "Must be email address."},
                    length: { in: 8..250 }
end
