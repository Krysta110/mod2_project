class CoursesController < ApplicationController

    before_action :current_course, only: [:show]

    def index
        @courses = Course.all 
    end

    def new
        @course = Course.new
        @students = Student.all
        @teachers = Teacher.all
    end

    def create 
        @course = Course.create(course_params)
        redirect_to @course
    end

    def edit
        
    end

    def update
    end


    def show

    end



    def current_course 
        @course = Course.find(params[:id])
    end

    private

    def course_params
        params.require(:course).permit(:name, :teacher_id)
    end
end
