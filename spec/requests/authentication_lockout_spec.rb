require 'rails_helper'

RSpec.describe "Authentication" do
  before do
    @student = User.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", course_name: "GBO INC")
    @assignment = Assignment.create(title: "title", description: "description",
      due_date: Date.new(2018-1-1))
    @homework = Homework.create(title: "title", user_id: 1, assignment_id: 1)
  end

  it "should redirect to login page" do
    get root_path
    expect(response).to redirect_to login_path
  end

  it "should block index pages" do
    get users_path
    expect(response).to redirect_to login_path
    get assignments_path
    expect(response).to redirect_to login_path
    get homeworks_path
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new students" do
    expect { post '/users', params: { user: @user } }.to_not change(User, :count)

    expect(response).to redirect_to login_path
  end

  it "denies access to creating new assignments" do
    expect { post '/assignments', params: { assignment: @assignment } }.to_not change(Assignment, :count)
    expect(response).to redirect_to login_path
  end

  it "denies access to creating new homework" do
    expect { post '/homeworks', params: { homework: @homework } }.to_not change(Homework, :count)
    expect(response).to redirect_to login_path
  end
end
