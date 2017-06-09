require 'rails_helper'

RSpec.describe "Admin login" do

  before :each do
    Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
  end

  # subject { described_class.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")}

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
    fill_in 'Email', with: 'jim@jim.com'
    fill_in 'Password', with: ' '
    click_button 'Save changes'
    expect(page).to have_text("Credentials incorrect.")
  end

  it "works correctly" do
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    fill_in 'Email', with: 'jim@jim.com'
    fill_in 'Password', with: 'password'
    click_button 'Save changes'
    expect(page).to have_text("You have logged in.")
  end

end