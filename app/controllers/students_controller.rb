class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_as_admin?, only: [:new, :create, :destroy]
  before_action :logged_in_as_student?

  # def index
  #   # WHEN YOU DO ASSIGNMENT, YOU LIST IT AS SUCH SO
  #   # STUDENT CAN ONLY SEE THEIR OWN WORK:
  #   # @assingments = Assignment.where(student_id: session[:user_id])
  #
  # end

  def index
    # @students = Admin.where(id: session[:user_id]) || @students = Student.where(id: session[:user_id])
    @students = Student.where(id: session[:user_id])
    @assignments = Assignment.where(student_id: session[:user_id])
    @homeworks = Homework.where(student_id: session[:user_id])

    # respond_to do |format|
    #   format.html
    #   format.csv { send_data @members.to_csv }
    # end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    # if session[:user_flavor] == "admin"
    #   redirect_to admins_path
    # else
    #   redirect_to students_path
    # end
    redirect_to root_path
  end

  private

    def set_student
      @student = Student.find(params[:id])
      # unless @student.admin_id == session[:user_id]
      #   redirect_to root_path
      # end
    end

    def student_params
      params.require(:student).permit(:name, :email, :password, :flavor, :admin_id, :avatar, assignment_ids: [])
    end
end
