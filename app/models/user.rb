# class to inherit user types from. includes all basic information.
class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :assignments
  has_many :homeworks
  validates :name, :password_digest, :role, :course_name, presence: true
  validates :email,
            uniqueness: true,
            format: { with: /\A\S+@.+\.\S+\z/, message: 'Must be email address.' },
            length: { in: 8..250 }
  has_attached_file :avatar,
                    styles: {
                      medium: '300x300>',
                      thumb: '100x100>',
                      tiny: '45x45#'
                    },
                    default_url: '/images/:style/default.png',
                    allow_nil: true
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/}

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      User.create!(row.to_hash)
    end
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_send_at = Time.zone.now
    save!
    ResetMailer.password_reset(self).deliver
  end
end
