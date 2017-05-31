require 'test_helper'

class RemindersControllerTest < ActionDispatch::IntegrationTest
  test "should get write_email" do
    get reminders_write_email_url
    assert_response :success
  end

  test "should get send_email" do
    get reminders_send_email_url
    assert_response :success
  end

end
