require 'rails_helper'

RSpec.describe Assignment, :type => :model do

  # before :each do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
  # end

  # before :all do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
  # end

  subject { described_class.create(title: "assignment", description: "buncha stuff", due_date: Date.new(2019-1-1)) }

  it "needs a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "needs a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "needs a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "needs a due_date" do
    subject.due_date = nil
    expect(subject).to_not be_valid
  end

  it "works right" do
    expect(subject).to be_valid
  end

end
