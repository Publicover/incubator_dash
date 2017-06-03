require 'test_helper'

class StudentsCanOnlySeeAssignmentsTest < ActionDispatch::IntegrationTest

  def setup
    log_in_as_student
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
