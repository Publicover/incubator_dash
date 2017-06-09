require 'rails_helper'

RSpec.describe "Student login" do

  before do
    Student.create(name: "jill", email: "jill@jill.com", password: "password", flavor: "student", admin_id: 1)
  end

  # subject { described_class.new(name: "jill", email: "jill@jill.com", password: "password", flavor: "student", admin_id: 1) }

  it "needs an email" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: ' '
    fill_in 'Password', with: 'password'
    click_button 'Save changes'
    expect(page).to have_text("Credentials incorrect.")
  end

  it "needs a password" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jill@jill.com'
    fill_in 'Password', with: ' '
    click_button 'Save changes'
    expect(page).to have_text("Credentials incorrect.")
  end

  it "works correctly" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jill@jill.com'
    fill_in 'Password', with: 'password'
    click_button 'Save changes'
    expect(page).to have_text("You have logged in.")
  end

end
