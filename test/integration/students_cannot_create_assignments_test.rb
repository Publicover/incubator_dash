require 'test_helper'

class StudentsMustChangePasswordOnFirstSigningInTest < ActionDispatch::IntegrationTest

  def setup
    log_in_as_student
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
      email: "jill@jill.com", password: "password", role: "student",
      course: "GSO"}}
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
      user_ids: [1, 2] }}
    # logout
    delete logout_path
  end

end
