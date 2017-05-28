require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

  def setup
    @assignment = assignments(:one)
  end

  test "class exists?" do
    assert @assignment.valid?
  end

  test "must have title" do
    @assignment.title = nil
    refute @assignment.valid?
    assert_not_nil @assignment.errors[:title]
  end

  test "must have description" do
    @assignment.description = nil
    refute @assignment.valid?
    assert_not_nil @assignment.errors[:name]
  end

  # test "must have due date" do
  #   @assignment.due_date = nil
  #   refute @assigment.valid?
  #   assert_not_nil @assignment.errors[:due_date]
  # end

  test "completed can be set" do
    @assignment.due_date = Date.yesterday
    assert true, @assignment.completed
  end

end
