require 'rails_helper'

RSpec.describe "Admin avatar" do

  before do
    @admin = Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jim@jim.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "should upload without trouble" do
    visit '/'
    expect(page).to have_content('View Profile:')
    click_link "USER PROFILE"
    click_link "EDIT"
    attach_file("admin[avatar]", Rails.root.join('spec', 'fixtures', 'jennifer_connelly.jpg'))
    click_button "Update Admin"
    expect(page).to have_xpath("//img[contains(@src,'jennifer_connelly.jpg')]")
  end

end
