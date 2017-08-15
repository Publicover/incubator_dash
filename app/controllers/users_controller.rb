class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :logged_in_as_admin?
  # before_action :logged_in_as_student?
  before_action :logged_in?

  def index
    @students = User.where(course_name: session[:course_name])
    @assignments = Assignment.all
    if session[:user_role] == "admin"
      render 'admin_index'
    else
      render 'index'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def change_avatar
    @user = User.find(params[:id])
  end

  def import
    User.import(params[:file])
    redirect_to users_path, notice: "IMPORT SUCCESSFUL"
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :role, :course_name, :avatar, assignment_ids: [])
    end
end
