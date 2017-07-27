require 'rails_helper'

RSpec.describe "Student password" do
  # let(:mail) { described_class.password_reset(student).deliver_now }
  # let(:student) { Student.create(name: "jill", email: "jill@jill.com",
  #   id: 1, password_reset_token: "sendthisrightawayplease") }
  # let(:address) { ["jill@jill.com"] }

  before do
    new_student = Student.create(name: "jill", email: "jill@jill.com",
      password: "password", flavor: "student", admin_id: 1,
      password_reset_token: "sendthisrightawayplease",
      password_reset_send_at: 1.hour.ago)
    new_admin = Admin.create(name: "jim", email: "jim@jim.com",
      password: "password", flavor: "admin")
    visit '/'
    expect(page).to have_text("You must log in to access this page")
    # fill_in 'email', with: 'jill@jill.com'
    # fill_in 'password', with: 'password'
    # click_button 'Log in'
    # expect(page).to have_text("You have logged in.")
  end

  it "sends a reset email" do
    click_link "Forget your password?"
    expect(page).to have_content("Reset your password")
    fill_in "email", with: "jill@jill.com"
    # expect { mail }.to change { ActionMailer::Base.deliveries.count }.by(1)
    # get edit_password_reset_path(password_reset_token: "sendthisrightawayplease")
    visit '/password_resets/sendthisrightawayplease/edit'
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password1"
    click_button "Update Password"
    # follow_redirect
    expect(page).to have_content("Password confirmation doesn't match Password")
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Update Password"
    expect(page).to have_content("Password has been reset")
  end

end
