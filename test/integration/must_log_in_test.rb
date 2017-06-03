require 'test_helper'

class MustLogInTest < ActionDispatch::IntegrationTest

  test "Admin login works well" do
    log_in_as_admin
  end

  test "Student login works well" do
    log_in_as_student
  end
end
