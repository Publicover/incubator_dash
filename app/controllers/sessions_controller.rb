class SessionsController < ApplicationController

  def new
    @disable_nav = true
  end

  def create
    @disable_nav = true
    user = Admin.find_by_email(params[:email]) || user = Student.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_flavor] = user.flavor
      session[:user_name] = user.name
      # session[:user_avatar] = user.avatar
      redirect_to root_path, notice: "You have logged in."
    else
      flash.now[:alert] = "Credentials incorrect."
      render "new"
    end
  end

  def destroy
    @disable_nav = true
    session[:user_id] = nil
    session[:user_flavor] = nil
    session[:user_name] = nil
    redirect_to login_path, notice: "You have logged out."
  end

end
