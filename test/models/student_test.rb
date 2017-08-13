require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @student = students(:one)
  end

  test "class exists" do
    assert @student.valid?
  end

  test "invalid without name" do
    @student.name = nil
    refute @student.valid?
    assert_not_nil @student.errors[:name]
  end

  test "invalid without email" do
    @student.email = nil
    refute @student.valid?
    assert_not_nil @student.errors[:email]
  end

  test "invalid without password" do
    @student.password = nil
    refute @student.valid?
    assert_not_nil @student.errors[:password]
  end

  test "invalid without role" do
    @student.role = nil
    refute @student.valid?
    assert_not_nil @student.errors[:role]
  end

end
