require 'rails_helper'

RSpec.describe "Student avatar" do

  before do
    new_student = Student.create(name: "jill", email: "jill@jill.com",
      password: "password", flavor: "student", admin_id: 1)
    new_admin = Admin.create(name: "jim", email: "jim@jim.com",
      password: "password", flavor: "admin")
    new_assignment = Assignment.create(title: "Bio", description: "Write a bio",
      due_date: Date.new(2017-1-1))
    new_homework = Homework.create(title: "cool file", student_id: 1,
      assignment_id: 1)
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "allows updates" do
    click_link "AVATAR"
    expect(page).to have_text("Students#change_avatar")
    attach_file("student[avatar]", Rails.root.join('spec', 'fixtures',
      'jennifer_connelly_2.jpg'))
    click_button "Update Student"
    expect(page).to have_text("jill")
    expect(page).to have_xpath("//img[contains(@src,'jennifer_connelly_2.jpg')]")
  end

end
