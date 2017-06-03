class MakeReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # File.open("mason.txt", 'w') do |f|
    #   f << "Testing first line"
    #   f << "Testing second line"
    # end
    StudentMailer.say_hi(args).deliver_now
  end
end
