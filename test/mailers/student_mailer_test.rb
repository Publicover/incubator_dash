require 'test_helper'

class StudentMailerTest < ActionMailer::TestCase
  test "view_single" do
    mail = StudentMailer.view_single
    assert_equal "View single", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
