require 'rails_helper'

RSpec.describe "Student avatar" do

  before :all do
    @student = Student.create(name: "jill", email: "jill@jill.com", password: "password", flavor: "student", admin_id: 1)
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jill@jill.com'
    fill_in 'Password', with: 'password'
    click_button 'Save changes'
    expect(page).to have_text("You have logged in.")
  end

  it "should upload without trouble" do
    visit '/'
    expect(page).to have_content('View Profile:')
    click_link "MY PROFILE"
    # follow_redirect!
    click_link "EDIT"
    # click_button("student_avatar")
    attach_file("student[avatar]", Rails.root + "spec/support/jennifer_connelly.jpg")
    # post student_path(id: 1), avatar: fixture_file_upload("spec/support/jennifer_connelly.jpg", "image/jpg")
    # expect(@student.avatar).to eq "jennifer_connelly.jpg"
  end

end
