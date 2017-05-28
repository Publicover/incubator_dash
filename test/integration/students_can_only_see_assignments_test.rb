require 'test_helper'

class StudentsCanOnlySeeAssignmentsTest < ActionDispatch::IntegrationTest

  def setup
    # Get to the login page
    get root_path
    assert_redirected_to login_path
    follow_redirect!
    # assert_template "new"
    assert_select 'h2', "Log in"
    assert_select "input[type=email]", 1
    assert_select "input[type=password]", 1
    # Log in
    post login_path email: "jill@jill.com", password: "jimjimjim"
    # assert_response :success
    assert_redirected_to root_path
    follow_redirect!
    # Make sure data populates on root
    assert_select 'h1', "Dashboards#index"
  end

  test "students can only see assignments" do
    # Make sure Student is blocked from adminthings
    get admins_path
    # assert_select 'h1', "Adminthings#index"
    assert_equal flash[:notice], "You do not have permission to access that page."
    # Make sure Student can see their own assignments
    get students_path
    assert_select 'h1', "Students#index"
    # Make sure logout works
    delete logout_path
  end
end
