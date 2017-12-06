require 'rails_helper'

RSpec.describe "Student avatar" do

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

  it "should upload without trouble" do
    visit '/'
    expect(page).to have_content('View Profile:')
    click_link "USER PROFILE"
    click_link "EDIT"
    attach_file("user[avatar]", Rails.root.join('spec', 'fixtures', 'jennifer_connelly.jpg'))
    click_button "Update"
    expect(page).to have_xpath("//img[contains(@src,'jennifer_connelly.jpg')]")
  end
end
