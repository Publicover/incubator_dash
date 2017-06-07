require 'test_helper'

class StudentCanCreateAvatarTest < ActionDispatch::IntegrationTest


  def setup
    log_in_as_admin
  end

  test "admin can attach avatar for student" do
    image = fake_file
    get admins_path
    post students_path, params: { student:
      { name: "testson",
        email: "test@test.com",
        password: "password",
        flavor: "student",
        admin_id: 1,
        avatar: image,
        assignment_ids: [1, 2] }
      }
    # assert_redirected_to student_path(assigns(:student))
    # assert_redirected_to({:action=>"show", :controller=>"students"})
    # assert_redirected_to(controller: "students", action: "show")
    # assert_redirected_to @student
    assert_response :redirect
  end

  # test "admin can patch info" do
  #   image = fake_file
  #   student = students(:one)
  #   updated_name = "Bob"
  #
  #   patch '/students/1', params:
  #     { student:
  #       { id: student.id,
  #         name: updated_name,
  #         email: student.email,
  #         password: student.password,
  #         flavor: student.flavor,
  #         admin_id: student.admin_id,
  #         avatar: image,
  #         assignment_ids: student.assignment_ids } }
  #   assert_equal updated_name, student.name
  # end


end
