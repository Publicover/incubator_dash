require 'rails_helper'

RSpec.describe Assignment do

  # before :each do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
  # end

  # before :all do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", role: "admin")
  # end

  subject { described_class.create(title: "assignment", description: "buncha stuff", due_date: Date.new(2090-1-1)) }

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

  it "works correctly" do
    expect(subject).to be_valid
  end

  it "adjusts value of :completed" do
    expect(subject.completed).to eq false
    subject.due_date = Date.new(2000-1-1)
    expect(subject.completed).to eq true
  end

end
