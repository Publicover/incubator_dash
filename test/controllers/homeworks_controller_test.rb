require 'test_helper'

class HomeworksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homeworks_index_url
    assert_response :success
  end

  test "should get show" do
    get homeworks_show_url
    assert_response :success
  end

  test "should get edit" do
    get homeworks_edit_url
    assert_response :success
  end

  test "should get create" do
    get homeworks_create_url
    assert_response :success
  end

  test "should get update" do
    get homeworks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get homeworks_destroy_url
    assert_response :success
  end

end
