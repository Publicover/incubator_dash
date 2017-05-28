require 'test_helper'

class AdminsCanSeeEverythingTest < ActionDispatch::IntegrationTest

  def setup
    # Get to the login page
    get root_path
    assert_redirected_to login_path
    follow_redirect!
    # assert_template "new"
    assert_select 'h2', "Log in"
    assert_select "input[type=email]", 1
    assert_select "input[type=password]", 1
    #Log in
    post login_path email: "jim@jim.com", password: "jimjimjim"
    # assert_response :success
    assert_redirected_to root_path
    follow_redirect!
    # Make sure data populates on root
    assert_select 'h1', "Dashboards#index"
  end

  test "admins can see indexes" do
    # Make sure Admin can see students and assignments
    get admins_path
    assert_select 'h2', "Listing Students"
    # Make sure Admin can see student pages if needed
    get students_path
    assert_select 'h1', "Students#index"
    # Make sure logout works
    delete logout_path
  end
end
