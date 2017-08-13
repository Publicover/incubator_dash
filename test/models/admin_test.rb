require 'test_helper'
require 'minitest/pride'

class AdminTest < ActiveSupport::TestCase

  def setup
    @admin = admins(:one)
  end

  test "class exists" do
    assert @admin.valid?
  end

  test "invalid without name" do
    @admin.name = nil
    refute @admin.valid?
    assert_not_nil @admin.errors[:name]
  end

  test "invalid without email" do
    @admin.email = nil
    refute @admin.valid?
    assert_not_nil @admin.errors[:email]
  end

  test "invalid without password" do
    @admin.password = nil
    refute @admin.valid?
    assert_not_nil @admin.errors[:password]
  end

  test "invalid without role" do
    @admin.role = nil
    refute @admin.valid?
    assert_not_nil @admin.errors[:role]
  end

  test "should have students" do
    assert_equal 2, @admin.students.size
  end

end
