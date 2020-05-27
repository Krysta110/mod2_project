class StudentsController < ApplicationController
    
    before_action :current_student, only: [:show, :edit, :update]

    def index
        @students = Student.all 
    end

    def new
        @student = Student.new
        @courses = Course.all
    end

    def create 
        @student = Student.create(student_params)
        redirect_to @student
    end

    def edit
        @courses = Course.all
    end

    def update
        @student.update(student_params)
        redirect_to "/students/#{@student.id}"
    end

    def show
    end

    def current_student 
        @student = Student.find(params[:id])
    end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :age, :gender, :grade_level, course_ids:[])
    end
    
    
end
