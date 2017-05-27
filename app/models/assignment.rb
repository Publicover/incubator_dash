class Assignment < ApplicationRecord
  has_and_belongs_to_many :students
  validates :title, :description, :due_date, presence: true

  def completed=(completed)
    # self[:due_date] > DateTime.now ? self[:completed] = true : self[:completed]
    # self[:completed] = true if self[:due_date] > Date.today
  end

  def completed
    self[:due_date] > Date.today ? self[:completed] = false : self[:completed] = true
  end

end
