require 'test_helper'

class OnlyAdminsCreateDataTest < ActionDispatch::IntegrationTest

  def setup
    # Get to the login page
    get root_path
    assert_redirected_to login_path
    follow_redirect!
    # Make sure we have it
    assert_select 'h2', "Log in"
    assert_select "input[type=email]", 1
    assert_select "input[type=password]", 1
    #Log in
    post login_path email: "jim@jim.com", password: "jimjimjim"
    assert_response :success
    assert_redirected_to root_path
    follow_redirect!
    # Make sure data populates on root
    assert_select 'h1', "Dashboards#index"
    assert_equal "You have logged in.", flash[:notice]
  end

  test "admin can create students" do
    # Go to new_student_path
    get new_student_path
    # Fill in name, email, password
    assert_select "input[type=text]"
    assert_select "input[type=email]"
    assert_select "input[type=password]"
    post students_path, params: { student: { name: "testson",
      email: "test@test.com", password: "password", flavor: "student",
      admin_id: 1, assignment_ids: [1, 2] }}
    # Assert it works
    assert_response :redirect
    delete logout_path
  end

  test "admin can create assignments" do
    get new_assignment_path
    assert_select "input[type=text]"
    post assignments_path, params: { assignment: { title: "Review",
      description: "This rocks", due_date: Date.new(2017, 1, 1),
      student_ids: [1, 2] }}
    # Assert redirection after creation
    assert_redirected_to assignment_path(id: 980190963)
    delete logout_path
  end

end
