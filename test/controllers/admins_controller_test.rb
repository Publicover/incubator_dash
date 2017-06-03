require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest

  def setup
    log_in_as_admin
  end

  test "should get index" do
    get admins_url
    assert_response :success
  end

end
