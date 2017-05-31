class ApplicationMailer < ActionMailer::Base
  default sender: 'jim@sprintwithdash.com'
  # default from: 'Tester@testerson.com'
  layout 'mailer'
end
