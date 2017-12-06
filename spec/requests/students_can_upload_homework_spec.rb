require 'rails_helper'

RSpec.describe "Student homework" do
  before do
    new_student = User.create(name: "jill", email: "jill@jill.com",
      password: "password", role: "student", course_name: "GBO INC")
    new_admin = User.create(name: "jim", email: "jim@jim.com",
      password: "password", role: "admin", course_name: "GBO INC")
    new_assignment = Assignment.create(title: "Bio", description: "Write a bio",
      due_date: Date.new(2017-1-1))
    new_homework = Homework.create(title: "cool file", user_id: 1,
      assignment_id: 1)
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

  it "allows images" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Listing All Assignments")
    visit '/assignments/1'
    expect(page).to have_text("ASSIGNMENT: Bio")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'jennifer_connelly.jpg'))
    click_button "Upload Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'jpg_icon50.png')]")
  end

  it "allows PDFs" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Listing All Assignments")
    visit '/assignments/1'
    expect(page).to have_text("ASSIGNMENT: Bio")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.pdf'))
    click_button "Upload Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'pdf_icon50.png')]")
  end

  it "allows TXTs" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Listing All Assignments")
    visit '/assignments/1'
    expect(page).to have_text("ASSIGNMENT: Bio")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.txt'))
    click_button "Upload Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_text("FILE UPLOADED:")
  end

  it "allows DOCXs" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Listing All Assignments")
    visit '/assignments/1'
    expect(page).to have_text("ASSIGNMENT: Bio")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.docx'))
    click_button "Upload Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'docx_icon50.png')]")
  end

  it "allows XLSXs" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Listing All Assignments")
    visit '/assignments/1'
    expect(page).to have_text("ASSIGNMENT: Bio")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.xlsx'))
    click_button "Upload Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'xlsx_icon50.png')]")
  end

end
