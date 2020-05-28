class AssignmentsController < ApplicationController
 
 before_action :current_assignment, only: [:show, :edit, :update]

    def index
        @assignments = Assignment.all 
    end

    def new
        @assignment = Assignment.new
        @courses = Course.all
    end

    def create 
        @assignment = Assignment.create(assignment_params)
        redirect_to @assignment
    end

    def edit
        @courses = Course.all
    end

    def update
        @assignment.update(assignment_params)
        redirect_to "/assignments/#{@assignment.id}"
    end


    def show

    end



    def current_assignment 
        @assignment = Assignment.find(params[:id])
    end

    private

    def assignment_params
        @assignment = params.require(:assignment).permit(:date, :description, :content, :course_id)
    end
end