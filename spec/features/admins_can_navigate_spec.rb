require 'rails_helper'

RSpec.describe "Admin navigation" do

  before do
    Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jim@jim.com'
    fill_in 'Password', with: 'password'
    click_button 'Save changes'
    expect(page).to have_text("You have logged in.")
  end

  it "should get index" do
    click_link 'STUDENTS'
    expect(page).to have_content 'Admins#index'
  end

end
