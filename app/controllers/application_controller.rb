class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    redirect_to login_path, notice: "You must log in to access this page" unless session[:user_id]
  end

  def logged_in_as_admin?
    redirect_to root_path, notice: "You do not have permission to access that page." unless session[:user_flavor] == "admin"
  end

  def logged_in_as_student?
    redirect_to root_path, notice: "NOPE NOPE NOPE--DON'T HAVE CREDENTIALS" unless session[:user_flavor] == "student" || session[:user_flavor] == "admin"
  end
  
end
