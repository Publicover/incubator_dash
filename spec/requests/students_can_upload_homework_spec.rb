require 'rails_helper'

RSpec.describe "Student homework" do

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

  it "allows images" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Students#index")
    # within_table("students-table") do
    #   # find(:xpath, "//*[text()='Bio']").click
    #   # find(:xpath, "//tr[td[contains(.,'jill')]]/td/a", :text => 'Bio').click
    #   # click_on "Bio"
    #   # find('td:nth-child(4)').find('a[href=assignments/1]').click
    #   # find('td:nth-child(4)').find(:xpath, "//a[@href='/assignments/1']").click
    #   # find('td:nth-child(4)').find(:css, 'a[href="/assignments/1"]')
    #   # find('td:nth-child(4)').click_link "Bio"
    #   # expect('td:nth-child(1)').to eq "jill"
    #   find('td:nth-child(4)').find(:xpath, "//*[text()='Bio']").click
    # end
    visit '/assignments/1'
    expect(page).to have_text("Assignments#show")
    # within('td') do
    #   click_on "Bio"
    # end
    # click_link "Bio"
    # expect(page).to have_text("Assignments#show")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'jennifer_connelly.jpg'))
    click_button "Update Homework"
    expect(page).to have_text("Homeworks#show")
    expect(page).to have_xpath("//img[contains(@src,'jpg_icon50.png')]")
  end


  it "allows PDFs" do
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
  end

  it "allows TXTs" do
    click_link "ASSIGNMENTS"
    expect(page).to have_text("Students#index")
    visit '/assignments/1'
    expect(page).to have_text("Assignments#show")
    click_button "Upload some homework?"
    attach_file("homework[document]", Rails.root.join('spec', 'fixtures',
      'example.txt'))
    click_button "Update Homework"
    expect(page).to have_text("Homeworks#show")
    # expect(page).to have_xpath("//img[contains(@src,'example.txt')]")
    expect(page).to have_text("UPLOADED FILE")
  end

  it "allows DOCXs" do
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
  end

  it "allows XLSXs" do
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
  end

end
