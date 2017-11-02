require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def log_in_as_admin
    # Get to the login page
    get root_path
    assert_redirected_to login_path
    follow_redirect!
    # assert_template "new"
    assert_select 'h2', "Log in"
    assert_select "input[type=email]", 1
    assert_select "input[type=password]", 1
    #Log in
    post login_path email: "jim@jim.com", password: "jimjimjim"
    # assert_response :success
    assert_redirected_to root_path
    follow_redirect!
    # Make sure data populates on root
    assert_select 'h1', "Dashboards#index"
  end

  def log_in_as_student
    # Get to the login page
    get root_path
    assert_redirected_to login_path
    follow_redirect!
    # assert_template "new"
    assert_select 'h2', "Log in"
    assert_select "input[type=email]", 1
    assert_select "input[type=password]", 1
    # Log in
    post login_path email: "jill@jill.com", password: "jimjimjim"
    # assert_response :success
    assert_redirected_to root_path
    follow_redirect!
    # Make sure data populates on root
    assert_select 'h1', "Dashboards#index"
  end

  def fake_file
    fixture_file_upload 'jennifer_connelly.jpg'
  end
end
