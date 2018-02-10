# class AssignmentsController < ApplicationController
  class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?


    def index
      @assignments = Assignment.all
    end

    def show
      @assignment = Assignment.find(params[:id])
      @homework = Homework.find_or_create_by(assignment_id: Assignment.find(params[:id]), user_id: current_user.id)
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
        if session[:user_role] == "admin"
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

    def import
      Assignment.import(params[:file])
      redirect_to assignments_path, notice: "Assignments created by CSV"
    end

    private

      def set_assignment
        @assignment = Assignment.find(params[:id])
      end

      def assignment_params
        params.require(:assignment).permit(:title, :description, :due_date, :completed, user_ids: [])
      end

  end
