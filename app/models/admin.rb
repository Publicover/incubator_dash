class Admin < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  has_many :students
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
    # default_url: "/images/default_avatar_silhoutte.png",
    allow_nil: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\//
  validates :name, :password_digest, :flavor, presence: true
  validates :email, presence: true, format: { with: /@/, message: "Must be email address."},
                    length: { in: 8..250 }
end
