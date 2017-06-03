require 'test_helper'

class OnlyAdminsCreateDataTest < ActionDispatch::IntegrationTest

  def setup
    log_in_as_admin
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
    assert_response :success
    # assert_response :redirect
    delete logout_path
  end

  test "admin can create assignments" do
    get new_assignment_path
    assert_select "input[type=text]"
    post assignments_path, params: { assignment: { title: "Review",
      description: "This rocks", due_date: Date.new(2017, 1, 1),
      student_ids: [1, 2] }}
    # Assert redirection after creation
    assert_redirected_to assignment_path(id: 3)
    delete logout_path
  end

end
