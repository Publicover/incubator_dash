require 'rails_helper'

RSpec.describe "Student avatar" do

  before :all do
    student_one = Student.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
  end

  it "should upload without trouble" do
    visit '/'
    click_link 'MY PROFILE'
  end


end
