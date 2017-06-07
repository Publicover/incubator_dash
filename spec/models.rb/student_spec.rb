require 'rails_helper'

RSpec.describe Student do

  let(:admin_one) { Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin") }

  subject { described_class.create(name: "jill", email: "jill@jill.com",
    password: "password", flavor: "student", admin_id: admin_one.id) }

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

  it "needs a flavor" do
    subject.flavor = nil
    expect(subject).to_not be_valid
  end

  it "needs an admin id" do
    subject.admin_id = nil
    expect(subject).to be_valid
  end

  # TODO avatar file upload?

  it "works right" do
    expect(subject).to be_valid
  end

end
