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
      # @assignments = Assignment.all(:include => :students, :conditions => ["student.id = ?", session[:user_id]])
      # @students = @assignments.student_ids
      # @user = Admin.where(admin_id: session[:user_id]) || @user = Student.where(student_id: session[:user_id])
      if session[:user_flavor] == "admin"
        render :index => 'testing_admin', :layout => 'testing_admin'
      else
        render :index => 'testing_student', :layout => 'testing_student'
      end
    end

    def show
      @assignment = Assignment.find(params[:id])
      # @students = Student.where(admin_id: session[:user_id])
      # @homework = Homework.where(assignment_id: session[:user_id])
      # if Homework.find(params[:id]).exist?
      #   @homework = Homework.find(params[:id])
      # else
      #   @homework = Homework.new
      # end
      # @homework = Homework.new
      @homework = Homework.find_or_create_by(assignment_id: Assignment.find(params[:id]), student_id: current_user.id)
      # @homework = Homework.find(params[:id]) || @homework = Homework.new
      # respond_to do |format|
      #   format.html {redirect_to "show" }
      #   # format.js
      # end
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
        if session[:user_flavor] == "admin"
          redirect_to @assignment
        else
          redirect_to students_path
        end
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

    def testing_admin
      @assignments = Assignment.all
    end

    def testing_student
      @assignments = Assignment.all
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
