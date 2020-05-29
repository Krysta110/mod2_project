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
        if @assignment.valid?
            @assignment.save
        redirect_to "/assignments/#{@assignment.id}"
        else 
            flash[:errors] = @assignment.errors.full_messages
            redirect_to "/assignments/new"
        end
    end

    def edit
        @courses = Course.all
    
    end

    def update
        @assignment.update(assignment_params)
        if @assignment.valid?
            @assignment.save
        redirect_to "/assignments/#{@assignment.id}"
        else 
            flash[:errors] = @assignment.errors.full_messages
            redirect_to "/assignments/#{@assignment.id}/edit"
        end
    end

    def show
    end

    def current_assignment 
        @assignment = Assignment.find(params[:id])
    end

    private

    def assignment_params
        params.require(:assignment).permit(:date, :description, :content, :difficulty, :course_id)
    end
    
    

end
