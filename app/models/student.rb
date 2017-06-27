class Student < ApplicationRecord
  has_secure_password
  belongs_to :admin
  has_and_belongs_to_many :assignments
  has_many :homeworks
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100#", tiny: "45x45#" },
    default_url: "/images/:style/default.png",
    allow_nil: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\//
  validates :name, :flavor, :admin_id, presence: true
  validates :email, uniqueness: true, format: { with: /@/, message: "Must be email address."},
                    length: { in: 8..250 }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Student.create!(row.to_hash)
    end
  end
end
