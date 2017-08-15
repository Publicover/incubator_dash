require 'rails_helper'

RSpec.describe User do

  let(:admin_one) { User.create(name: "jim", email: "jim@jim.com",
    password: "password", role: "admin", course_name: "GBO INC") }

  subject { described_class.create(name: "jill", email: "jill@jill.com",
    password: "password", role: "student", course_name: "GBO INC") }

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

  # it "needs an admin id" do
  #   subject.admin_id = nil
  #   expect(subject).to_not be_valid
  # end

  it "needs a course name" do
    subject.course_name = nil
    expect(subject).to_not be_valid
  end

  # TODO avatar file upload?

  it "works right" do
    expect(subject).to be_valid
  end

end
