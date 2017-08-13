class Student < ApplicationRecord
  # attr_accessor :email, :password, :password_confirmation
  has_secure_password
  belongs_to :admin
  has_and_belongs_to_many :assignments
  # has_many :assignments_students
  # has_many :assignments, :through => :assignments_students
  has_many :homeworks
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100#", tiny: "45x45#" },
    default_url: "/images/:style/default.png",
    allow_nil: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\//
  validates :name, :role, :admin_id, presence: true
  validates :email, uniqueness: true, format: { with: /@/, message: "Must be email address."},
                    length: { in: 8..250 }
  # validates_presence_of :password, :on => :create
  # before_create { generate_token(:auth_token) }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Student.create!(row.to_hash)
    end
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Student.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_send_at = Time.zone.now
    save!
    ResetMailer.password_reset(self).deliver
  end
end
