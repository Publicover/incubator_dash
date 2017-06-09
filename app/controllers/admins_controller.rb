class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_as_admin?

  def index
    @admins = Admin.where(id: session[:user_id])
    @students = Student.where(admin_id: session[:user_id])
    # MakeReminderJob.perform_now("jim@sprintwithdash.com")
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to @admin
    else
      render 'new'
    end
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update(admin_params)
      redirect_to @admin
    else
      render 'edit'
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy

    if session[:user_flavor] == "admin"
      redirect_to admins_path
    else
      redirect_to students_path
    end
  end

  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:name, :email, :password, :flavor, :avatar)
    end
end
