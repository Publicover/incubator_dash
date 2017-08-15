require 'rails_helper'

RSpec.describe User do

  # before :each do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
  # end

  # before :all do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
  # end

  subject { described_class.create(name: "jim", email: "jim@jim.com",
    password: "password", role: "admin", course_name: "GBO INC") }

  it "needs a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "needs an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "needs a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "needs a role" do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  it "needs a course name" do
    subject.course_name = nil
    expect(subject).to_not be_valid
  end

  it "works right" do
    expect(subject).to be_valid
  end

end
