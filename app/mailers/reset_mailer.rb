class ResetMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reset_mailer.password_reset.subject
  #
  def password_reset(student)
    @greeting = "Hey"
    @student = student
    # mail :to => student.email, :subject => "dash creative Password Reset"
    mail to: student.email, subject: "dash creative Password Reset"
  end
end
