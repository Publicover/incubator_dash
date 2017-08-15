require 'rails_helper'

RSpec.describe "Site login" do

  before do
    new_student = User.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", course_name: "GBO INC")
    new_admin = User.create(name: "jim", email: "jim@jim.com",
      password: "password", role: "admin", course_name: "GBO INC")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "can remember users" do
    flunk
  end

end
