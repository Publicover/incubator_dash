class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def logged_in?
    redirect_to login_path, notice: 'You must log in to access this page' unless session[:user_id]
  end

  def logged_in_as_admin?
    redirect_to root_path, notice: 'You do not have permission to access that page.' unless session[:role] == 'admin'
  end

  def logged_in_as_student?
    redirect_to root_path, notice: "NOPE NOPE NOPE--DON'T HAVE CREDENTIALS" unless session[:user_role] == 'student'
  end

  private

    def current_user
      # if session[:user_role] == 'admin'
      #   @current_user ||= Admin.find(session[:user_id])
      # else
      #   @current_user ||= Student.find(session[:user_id])
      # end
      @current_user ||= User.find(session[:user_id])
    end

end
