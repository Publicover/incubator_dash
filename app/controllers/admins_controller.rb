class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_as_admin?

  def index
    @admins = Admin.where(id: session[:user_id])
    @students = Student.where(admin_id: session[:user_id])
    MakeReminderJob.perform_now("jim@sprintwithdash.com")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params
      params.require(:admin).permit(:name, :email, :password, :flavor)
    end
end
