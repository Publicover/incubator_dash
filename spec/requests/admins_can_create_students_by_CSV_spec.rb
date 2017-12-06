require 'rails_helper'

RSpec.describe "Admin student creation" do
  before do
    @user = User.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin",
      course_name: "GBO INC")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "takes a CSV" do
    click_link "STUDENTS"
    expect(page).to have_text("Admins#index")
    attach_file("choose-student", Rails.root.join('student_test.csv'))
    click_button "IMPORT CSV"
    expect(page).to have_text("jill")
  end

end
