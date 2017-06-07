require 'rails_helper'

RSpec.describe "Authentication" do

  # before :all do
  #   Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
  #   visit '/'
  #   expect(page).to have_text("You must log in to access this page")
  #   fill_in 'Email', with: 'jim@jim.com'
  #   fill_in 'Password', with: 'password'
  #   click_button 'Save changes'
  #   expect(page).to have_text("You have logged in.")
  # end

  it "should redirect to login page" do
    get root_path
    expect(response).to redirect_to login_path
  end

  it "should block index pages" do
    get students_path
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response).to redirect_to login_path
    get admins_path
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response).to redirect_to login_path
    get assignments_path
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response).to redirect_to login_path
    get homeworks_path
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new students" do
    new_student = Student.create(name: "jill", email: "jill@jill.com",
      password: "password", flavor: "student", admin_id: 1)

    expect { post '/students', params: { student: new_student } }.to_not change(Student, :count)
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new assignments" do
    new_assignment = Assignment.create(title: "title", description: "description", due_date: Date.new(2018-1-1))

    expect { post '/assignments', params: { assignment: new_assignment } }.to_not change(Assignment, :count)
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new homework" do
    new_homework = Homework.create(title: "title", student_id: 1, assignment_id: 1)

    expect { post '/homeworks', params: { homework: new_homework } }.to_not change(Homework, :count)
    expect(response).to redirect_to root_path
    follow_redirect!
    expect(response).to redirect_to login_path
  end

end
