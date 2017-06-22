require 'rails_helper'

RSpec.describe "dashboard index" do

  before do
    new_student = Student.create(name: "jill", email: "jill@jill.com",
      password: "password", flavor: "student", admin_id: 1)
    new_admin = Admin.create(name: "jim", email: "jim@jim.com",
      password: "password", flavor: "admin")
    new_assignment = Assignment.create(title: "Bio", description: "Write a bio",
      due_date: Date.new(2017-1-1))
    new_homework = Homework.create(title: "cool file", student_id: 1,
      assignment_id: 1)
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jill@jill.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "should get name" do
    expect(page).to have_text("session[:user_name]: jill")
    expect(page).to have_text("current_user.name': jill")
    expect(page).to have_text("session[:user_id]: 1")
    expect(page).to have_text("session[:user_flavor]: student")
  end

end
