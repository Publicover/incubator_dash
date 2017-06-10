# class AssignmentsController < ApplicationController
  class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_as_admin?, only: [:new, :create, :destroy]
    before_action :logged_in_as_student?


    def index
      # @students = Student.where(admin_id: session[:user_id])
      # @assignments = Assignment.where(student_id: session[:user_id])
      # @assignments = Assignment.where(:student_ids.include?(session[:user_id]))
      # @assignments = AssignmentStudents.where(student_id: session[:user_id])
      # @assignments = Assignment.where(student_ids: session[:user_id])
      # @assignment = Assignment.find(params[:id])
      # if params[:student_ids].present?
      #   @assignment.students = Student.where(id: params[:user_id])
      # end
      @assignments = Assignment.all
      # @students = @assignments.student_ids
      # @user = Admin.where(admin_id: session[:user_id]) || @user = Student.where(student_id: session[:user_id])
    end

    def show
      @assignment = Assignment.find(params[:id])
      # @students = Student.where(admin_id: session[:user_id])
      # @homework = Homework.where(assignment_id: session[:user_id])
      @homework = Homework.new
    end

    def new
      @assignment = Assignment.new
    end

    def edit
      @assignment = Assignment.find(params[:id])
    end

    def create
      @assignment = Assignment.new(assignment_params)

      if @assignment.save
        redirect_to @assignment
      else
        render 'new'
      end
    end

    def update
      @assignment = Assignment.find(params[:id])

      if @assignment.update(assignment_params)
        redirect_to @assignment
      else
        render 'edit'
      end
    end

    def destroy
      @assignment = Assignment.find(params[:id])
      @assignment.destroy

      redirect_to assignments_path
    end

    private

      def set_assignment
        @assignment = Assignment.find(params[:id])
        # unless @assignment.student_id == session[:user_id]
        # unless @assignment.student_ids.include?(session[:user_id])
        #   redirect_to root_path
        # end
      end

      def assignment_params
        params.require(:assignment).permit(:title, :description, :due_date, :completed, student_ids: [])
      end

  end
