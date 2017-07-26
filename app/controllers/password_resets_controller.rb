class PasswordResetsController < ApplicationController
  before_action :disable_nav

  def new
  end

  def edit
    @student = Student.find_by_password_reset_token!(params[:id])
  end

  def create
    student = Student.find_by_email(params[:email])
    student.send_password_reset if student
    redirect_to login_path, :notice => "Email sent with reset instructions"
  end

  def update
    @student = Student.find_by_password_reset_token!(params[:id])
    if @student.password_reset_send_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired"
    elsif @student.update_attributes(student_params)
      redirect_to login_path, :notice => "Password has been reset"
    else
      render :edit
    end
  end

  private

    def student_params
      params.require(:student).permit(:password, :password_confirmation)
    end

    def disable_nav
      @disable_nav = true
    end

end
