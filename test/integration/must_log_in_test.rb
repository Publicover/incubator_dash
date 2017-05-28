require 'test_helper'

class MustLogInTest < ActionDispatch::IntegrationTest

  test "Admin login works well" do
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
    delete logout_path
  end

  test "Student login works well" do
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
    assert_response :success
    assert_redirected_to root_path
    follow_redirect!
    # Make sure data populates on root
    assert_select 'h1', "Dashboards#index"
    delete logout_path
  end
end
