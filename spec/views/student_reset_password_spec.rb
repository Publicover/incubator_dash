require 'rails_helper'

RSpec.describe "dashboard index" do

  before do
    guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
    lady = Student.create(name: "jill", email: "jill@jill.com", password: "password", role: "student", admin_id: 1)
    visit '/'
    expect(page).to have_text("You must log in to access this page")
  end

  it "should navigate to form" do
    click_link "Forget your password?"
    expect(page).to have_text("RESET YOUR PASSWORD")
    fill_in 'email', with: 'jill@jill.com'
    click_button 'Reset PW'
    expect(page).to have_text("Email sent with reset instructions")
  end
end
