require 'rails_helper'

RSpec.describe "Student login" do

  before do
    Student.create(name: "jill", email: "jill@jill.com", password: "password", flavor: "student", admin_id: 1)
  end

  # subject { described_class.new(name: "jill", email: "jill@jill.com", password: "password", flavor: "student", admin_id: 1) }

  it "needs an email" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: ' '
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("Credentials incorrect.")
  end

  it "needs a password" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: ' '
    click_button 'Log in'
    expect(page).to have_text("Credentials incorrect.")
  end

  it "works correctly" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text("You have logged in.")
  end

end
