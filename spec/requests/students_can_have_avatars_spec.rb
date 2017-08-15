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
    # follow_redirect!
    click_link "EDIT"
    # click_button("student_avatar")
    # , Rails.root.join('spec', 'fixtures', 'sample_photo.jpg') # Put your sample_photo.jpg at /spec/fixtures/sample_photo.jpg
    attach_file("user[avatar]", Rails.root.join('spec', 'fixtures', 'jennifer_connelly.jpg'))
    # post student_path(id: 1), avatar: fixture_file_upload("spec/support/jennifer_connelly.jpg", "image/jpg")
    # expect(@student.avatar_file_name).to eq "jennifer_connelly.jpg"
    # expect(@student.avatar_content_type). to eq "jpg"
    # expect(@student.name).to eq "jill"
    # expect(@student.name).to eq "jill"
    click_button "Update"
    # expect(page).to have_content "alt=Jennifer connelly"
    # expect(page).to have_xpath('//img[src="//Users/jimpublicover/Desktop/incubator_dash/spec/fixtures/jennifer_connelly.jpg"]')
    expect(page).to have_xpath("//img[contains(@src,'jennifer_connelly.jpg')]")
  end

end
