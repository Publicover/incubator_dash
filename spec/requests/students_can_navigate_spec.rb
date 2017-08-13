  require 'rails_helper'

RSpec.describe "Student navigation" do

  before do
    new_student = User.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", course_name: "GBO INC")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "should get index" do
    click_link 'USER PROFILE'
    expect(page).to have_content 'jill'
  end

  it "should get their own profile" do
    click_link 'ASSIGNMENTS'
    expect(page).to have_content 'Students#index'
  end

  it "should get new students page" do
    click_link 'AVATAR'
    expect(page).to have_content 'Students#change_avatar'
  end

end
