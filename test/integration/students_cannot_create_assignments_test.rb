require 'test_helper'

class StudentsCannotCreateDataTest < ActionDispatch::IntegrationTest

  def setup
    get root_path
    assert_redirected_to login_path
    follow_redirect!
    # Make sure we have it
    assert_select 'h2', "Log in"
    assert_select "input[type=email]", 1
    assert_select "input[type=password]", 1
    #Log in
    post login_path email: "jill@jill.com", password: "jimjimjim"
    # assert_response :success
    assert_redirected_to root_path
    follow_redirect!
    # Make sure data populates on root
    assert_select 'h1', "Dashboards#index"
    assert_equal "You have logged in.", flash[:notice]
  end

  test "students cannot create students" do
    # Student can go to student index
    get students_path
    assert_select 'h1', "Students#index"
    # Student only sees their own assignments
    assert_select 'td', "jill"
    assert_select 'td', "jill@jill.com"
    # Trying to post to new_assignment_path gives flash notice we can assert_equal flash[:notice]
    post students_path, params: { student: { name: "jill",
      email: "jill@jill.com", password: "password", flavor: "student",
      admin_id: 1}}
    assert_equal "You do not have permission to access that page.", flash[:notice]
    # logout
    delete logout_path
  end

  test "students cannot create assignments" do
    # Students can go to assignments index
    get assignments_path
    # Students can see all assignments
    assert_select 'h1', "Assignments#index"
    # Trying to post to new assignment path gives flash notice we can assert equal flash[:notice]
    post assignments_path, params: { assignment: { title: "Review",
      description: "This rocks", due_date: Date.new(2017, 1, 1),
      student_ids: [1, 2] }}
    # logout
    delete logout_path
  end

end
