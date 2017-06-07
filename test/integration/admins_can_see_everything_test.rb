require 'test_helper'

class AdminsCanSeeEverythingTest < ActionDispatch::IntegrationTest

  def setup
    log_in_as_admin
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

  # test "admins can see indexes" do
  #   visit admins_path
  # end

end
