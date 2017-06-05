class Student < ApplicationRecord
  has_secure_password
  belongs_to :admin
  has_and_belongs_to_many :assignments
  has_attached_file :avatar
  # validates_attachment_content_type :avatar, :content_type "image"
  validates_attachment_content_type :avatar, content_type: /\Aimage\//
  validates :name, :flavor, presence: true
  validates :email, uniqueness: true, format: { with: /@/, message: "Must be email address."},
                    length: { in: 8..250 }
end
