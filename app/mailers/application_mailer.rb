class ApplicationMailer < ActionMailer::Base
  # default sender: 'jim@sprintwithdash.com'
  default from: 'The Jim <jim@sprintwithdash.com>'
  layout 'mailer'
end
