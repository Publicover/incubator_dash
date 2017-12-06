class Assignment < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :homeworks
  validates :title, :description, :due_date, presence: true

  def completed=(completed)
    completed
  end

  def completed
    right_now = Date.today
    date_due = read_attribute(:due_date)
    if right_now && right_now > date_due
      return true
    else
      return false
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Assignment.create!(row.to_hash)
    end
  end
end
