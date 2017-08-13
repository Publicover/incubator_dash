class Assignment < ApplicationRecord
  has_and_belongs_to_many :users
  # has_many :assignments_students
  # has_many :students, :through => :assignments_students
  has_many :homeworks
  # before_validation :check_date
  validates :title, :description, :due_date, presence: true

  def completed=(completed)
    completed
  end
  #
  def completed
  # # #   # self[:due_date] > Date.today ? self[:completed] = false : self[:completed] = true
  #   # if @assignment.due_date > Date.today
  #   if params[:due_date] > Date.today
  #     true
  #   end
  # #   date_due = read_attribute(:due_date)
  # #   if date_due > Date.today
  # #     return true
  # #   else
  # #     return false
  # #   end
  #   # date_due = self[:due_date]
  #   # if date_due > Date.today
  #   #   return true
  #   # end
  # end

  # def completed
  #   if @assignment[:due_date] > Date.today
  # end
    right_now = Date.today
    # date_due = @assignment.due_date
    # date_due = self[:due_date]
    # date_due = params[:due_date]
    # date_due = assignment_params(:due_date)
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
