class TeachersController < ApplicationController

    before_action :current_teacher, only: [:show]

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
    end


    def show

    end



    def current_teacher 
        @teacher = Teacher.find(params[:id])
    end

    private

    def teacher_params
        params.require(:teacher).permit(:first_name, :last_name)
    end

end



