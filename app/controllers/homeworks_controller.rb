class HomeworksController < ApplicationController
  before_action :logged_in?

  def index
    @homework = Homework.all
  end

  def show
    @homework = Homework.find(params[:id])
  end

  def new
    @homework = Homework.new
  end

  def edit
    @homework = Homework.find(params[:id])
  end

  def create
    @homework = Homework.new(homework_params)

    if @homework.save
      redirect_to @homework
    else
      render 'new'
    end
  end

  def update
    @homework = Homework.find(params[:id])

    if @homework.update(homework_params)
      redirect_to @homework
    else
      render 'edit'
    end
  end

  def destroy
    @homework = Homework.find(params[:id])
    @homework.destroy

    if session[:user_role] == "admin"
      redirect_to homeworks_path
    else
      redirect_to students_path
    end
  end

  private

    def set_homework
      @homework = Homework.find(params[:id])
    end

    def homework_params
      params.require(:homework).permit(:title, :user_id, :assignment_id, :document)
    end
end
