require 'rails_helper'

RSpec.describe "Admin navigation" do

  before do
    Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "should get index" do
    click_link 'STUDENTS'
    expect(page).to have_content 'Admins#index'
  end

  it "should get their own profile" do
    click_link 'USER PROFILE'
    expect(page).to have_content 'Admins#show'
  end

  it "should get new students page" do
    click_link 'NEW STUDENTS'
    expect(page).to have_content 'Students#new'
  end

  it "should get new students page" do
    click_link 'ASSIGNMENT INDEX'
    expect(page).to have_content 'Listing All Assignments'
  end

  it "should get new students page" do
    click_link 'NEW ASSIGNMENTS'
    expect(page).to have_content 'Assignments#new'
  end

  it "should get new students page" do
    click_link 'ALL HOMEWORK'
    expect(page).to have_content 'Upload some homework:'
  end

  it "should get new students page" do
    click_link 'NEW HOMEWORK'
    expect(page).to have_content 'Homeworks#new'
  end

end
