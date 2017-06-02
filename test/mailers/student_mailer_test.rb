require 'test_helper'

class StudentMailerTest < ActionMailer::TestCase
  test "say_hi" do
    mail = StudentMailer.say_hi("to@example.org")
    assert_equal "#holdmybeer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["jim@sprintwithdash.com"], mail.from
    # assert_match "Hi", mail.body.encoded
  end

end
