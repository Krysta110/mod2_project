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
        # byebug
        @assignment = Assignment.new(assignment_params)
        redirect_to "/assignments/#{@assignment.id}"
    end

    def edit
    
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
        params.require(:assignment).permit(:date, :description, :content, :course_id)
    end
    
    

end
