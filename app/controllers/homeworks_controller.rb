class HomeworksController < ApplicationController
  # before_action :logged_in_as_admin?
  before_action :logged_in_as_student?

  def index
    # if session[:user_flavor] == "admin"
      @homework = Homework.all
    # else
    #   @homeworks = Homework.where(student_id: session[:user_id])
    # end
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

    if session[:user_flavor] == "admin"
      redirect_to homeworks_path
    else
      redirect_to students_path
    end
  end

  private

    def homework_params
      params.require(:homework).permit(:title, :student_id, :assignment_id, :document)
    end
end
