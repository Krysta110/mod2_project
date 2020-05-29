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
        if @student.valid?
            @student.save
        redirect_to @student
        else
            flash[:errors] = @student.errors.full_messages
            redirect_to "/students/new"
        end
    end

    def edit
        @courses = Course.all
    end

    def update
        @student.update(student_params)
        if @student.valid?
            @student.save
            redirect_to "/students/#{@student.id}"
        else
            flash[:errors] = @student.errors.full_messages
            redirect_to "/students/#{@student.id}/edit"
        end
        
    end

    def show
    end

    def list_all_my_teachers
        @student = current_student
        render :list_all_my_teachers
    end

    def services
        render :student_services
    end

    def no_courses
        render :student_no_courses
    end

    def current_student 
        @student = Student.find(params[:id])
    end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :age, :gender, :grade_level, course_ids:[])
    end
    
    
end
