class TeachersController < ApplicationController

    before_action :current_teacher, only: [:show, :edit, :update]

    def index
        @teachers = Teacher.all 
    end

    def new
        @teacher = Teacher.new
        @students = Student.all
    end

    def create 
        @teacher = Teacher.create(teacher_params)
        redirect_to @teacher
    end

    def edit
    end

    def update
        @teacher.update(teacher_params)
        redirect_to @teacher
    end


    def show

    end

    def list_all_my_students
        @teacher = current_teacher
        render :list_all_my_students
    end

    def services
        render :services
    end

    def no_courses
        render :no_courses
    end

    def current_teacher 
        @teacher = Teacher.find(params[:id])
    end

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name)
    end
   

end
