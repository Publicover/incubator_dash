require 'rails_helper'

RSpec.describe "Authentication" do

  # let(:admin_one) { Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin") }
  # let(:student_one) { Student.create(name: "jill", email: "jill@jill.com", password: "password", role: "student", admin_id: 1) }

  # before :all do
  #   @admin = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
  #   # visit '/'
  #   # expect(page).to have_text("You must log in to access this page")
  #   # fill_in 'Email', with: 'jim@jim.com'
  #   # fill_in 'Password', with: 'password'
  #   # click_button 'Save changes'
  #   # expect(page).to have_text("You have logged in.")

  before do
    @student = User.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", course_name: "GBO INC")
    @assignment = Assignment.create(title: "title", description: "description",
      due_date: Date.new(2018-1-1))
    @homework = Homework.create(title: "title", user_id: 1, assignment_id: 1)
  end
  # end

  it "should redirect to login page" do
    get root_path
    expect(response).to redirect_to login_path
  end

  it "should block index pages" do
    get users_path
    # expect(response).to redirect_to root_path
    # follow_redirect!
    expect(response).to redirect_to login_path
    get assignments_path
    # expect(response).to redirect_to root_path
    # follow_redirect!
    expect(response).to redirect_to login_path
    get homeworks_path
    # expect(response).to redirect_to root_path
    # follow_redirect!
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new students" do
    expect { post '/users', params: { user: @user } }.to_not change(User, :count)
    # expect(response).to redirect_to root_path
    # follow_redirect!
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new assignments" do
    expect { post '/assignments', params: { assignment: @assignment } }.to_not change(Assignment, :count)
    # expect(response).to redirect_to root_path
    # follow_redirect!
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new homework" do
    expect { post '/homeworks', params: { homework: @homework } }.to_not change(Homework, :count)
    # expect(response).to redirect_to root_path
    # follow_redirect!
    expect(response).to redirect_to login_path
  end

  # it "lets admins create students" do
  #   # new_admin = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
  #
  #   visit '/'
  #   fill_in 'Email', with: 'jim@jim.com'
  #   fill_in 'Password', with: 'password'
  #   click_button 'Save changes'
  #   expect(page).to have_text("You have logged in.")
  #
  #   new_student = Student.create(name: "jill", email: "jill@jill.com",
  #     password: "password", role: "student", admin_id: 1)
  #   expect { post '/students', params: { student: new_student } }.to change(Student, :count)
  # end

  # it "lets admins create assignments" do
  #   # new_admin = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
  #
  #   visit '/'
  #   fill_in 'Email', with: 'jim@jim.com'
  #   fill_in 'Password', with: 'password'
  #   click_button 'Save changes'
  #   expect(page).to have_text("You have logged in.")
  #
  #   new_assignment = Assignment.create(title: "bio", description: "write a bio", due_date: Date.new(2019-1-1), completed: false)
  #   expect { post '/assignments', params: { assignment: new_assignment } }.to change(Assignment, :count)
  # end
  #
  # it "lets students look at assignments" do
  #   flunk
  # end
  #
  # it "lets students upload homework to assignments" do
  #   flunk
  # end



end
