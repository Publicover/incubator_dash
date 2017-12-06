require 'rails_helper'

RSpec.describe "Student login" do
  before do
    new_student = User.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", course_name: "GBO INC")
  end

  it "needs an email" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: ' '
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("Credentials incorrect.")
  end

  it "needs a password" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: ' '
    click_button 'Log in'
    expect(page).to have_text("Credentials incorrect.")
  end

  it "works correctly" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

end
