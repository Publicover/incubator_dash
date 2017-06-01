class StudentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.student_mailer.view_single.subject
  #
  def say_hi(address)
    @greeting = "Hey there."

    mail to: address, subject: "#holdmybeer"
  end

  def send_reminder
    @greeting = "Hey there."

    mail to: "to@example.org", subject: "Reminder that's it's #{Date.today}."
  end
end
