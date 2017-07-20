class PasswordResetsController < ApplicationController
  before_action :disable_nav

  def new
  end

  def create
    student = Student.find_by_email(params[:email])
    student.send_password_reset if student
    redirect_to root_path, :notice => "Email sent with reset instructions"
  end

  private

    def disable_nav
      @disable_nav = true
    end

end
