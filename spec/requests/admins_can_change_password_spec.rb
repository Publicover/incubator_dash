require 'rails_helper'

RSpec.describe "Admin password reset" do

  before do
    @admin = Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "sends an email" do
    flunk
  end
  
end
