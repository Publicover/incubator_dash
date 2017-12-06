require 'rails_helper'

RSpec.describe Homework do
  let(:student_one) { User.create(name: "jill", email: "jill@jill.com",
    password: "password", role: "student", course_name: "GBO INC") }
  let(:assignment_one) { Assignment.create(title: "title", description: "whatever", due_date: Date.new(2019-1-1))}

  subject { described_class.create(title: "lesson?", user_id: student_one.id, assignment_id: assignment_one.id) }

  it "needs a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "needs an user_id" do
    subject.user_id = nil
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
