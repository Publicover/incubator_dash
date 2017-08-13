require 'rails_helper'

RSpec.describe "dashboard index" do

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

  it "should get name" do
    expect(page).to have_text("Hey, jim")
    expect(page).to have_text("session[:user_name]: jim")
    expect(page).to have_text("session[:user_role]: admin")
  end

end
