require 'rails_helper'

RSpec.describe "Students can get icons" do

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
    fill_in 'Email', with: 'jill@jill.com'
    fill_in 'Password', with: 'password'
    click_button 'Save changes'
    expect(page).to have_text("You have logged in.")
  end

  it "shows pdf icon" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Students#index")
    visit '/assignments/1'
    expect(page).to have_text("Assignments#show")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.pdf'))
    click_button "Update Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'pdf_icon50.png')]")
    visit '/students/1'
    expect(page).to have_text("Students#show")
    expect(page).to have_xpath("//img[contains(@src,'pdf_icon50.png')]")
  end

  it "shows docx icon" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Students#index")
    visit '/assignments/1'
    expect(page).to have_text("Assignments#show")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.docx'))
    click_button "Update Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'docx_icon50.png')]")
    visit '/students/1'
    expect(page).to have_text("Students#show")
    expect(page).to have_xpath("//img[contains(@src,'docx_icon50.png')]")
  end

  it "shows jpg icon" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Students#index")
    visit '/assignments/1'
    expect(page).to have_text("Assignments#show")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'jennifer_connelly.jpg'))
    click_button "Update Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'jpg_icon50.png')]")
    visit '/students/1'
    expect(page).to have_text("Students#show")
    expect(page).to have_xpath("//img[contains(@src,'jpg_icon50.png')]")
  end

  it "shows xlsx icon" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Students#index")
    visit '/assignments/1'
    expect(page).to have_text("Assignments#show")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.xlsx'))
    click_button "Update Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'xlsx_icon50.png')]")
    visit '/students/1'
    expect(page).to have_text("Students#show")
    expect(page).to have_xpath("//img[contains(@src,'xlsx_icon50.png')]")
  end

end
