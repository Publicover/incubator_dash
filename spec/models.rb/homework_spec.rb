require 'rails_helper'

RSpec.describe Homework do

  # before :each do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
  # end

  # before :all do
  #   new_guy = Admin.create(name: "jim", email: "jim@jim.com", password: "password", flavor: "admin")
  # end

  let(:student_one) { Student.create(name: "jim", email: "jim@jim.com",
    password: "password", flavor: "admin", admin_id: 1) }
  let(:assignment_one) { Assignment.create(title: "title", description: "whatever", due_date: Date.new(2019-1-1))}

  subject { described_class.create(title: "lesson?", student_id: student_one.id, assignment_id: assignment_one.id) }

  it "needs a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "needs an student_id" do
    subject.student_id = nil
    expect(subject).to_not be_valid
  end

  it "needs a assignment_id" do
    subject.assignment_id = nil
    expect(subject).to_not be_valid
  end

  it "works right" do
    expect(subject).to be_valid
  end

end
