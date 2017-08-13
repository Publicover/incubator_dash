require 'rails_helper'

RSpec.describe "Site login" do

  before do
    new_student = Student.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", admin_id: 1)
    new_admin = Admin.create(name: "jim", email: "jim@jim.com",
      password: "password", role: "admin")
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
