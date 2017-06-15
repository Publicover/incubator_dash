require 'rails_helper'

RSpec.describe "dashboard index" do

  before do
    new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jim@jim.com'
    fill_in 'Password', with: 'password'
    click_button 'Save changes'
    expect(page).to have_text("You have logged in.")
  end

  it "should get name" do
    expect(page).to have_text("session[:user_name]: jim")
    expect(page).to have_text("current_user.name': jim")
    expect(page).to have_text("session[:user_id]: 1")
    expect(page).to have_text("session[:user_flavor]: admin")
  end

end
