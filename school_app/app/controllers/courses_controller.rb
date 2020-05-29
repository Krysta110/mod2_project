class CoursesController < ApplicationController

    before_action :current_course, only: [:show, :edit, :update]

    def index
        @courses = Course.all 
    end

    def new
        @course = Course.new
        @teachers = Teacher.all
    end

    def create 
        # byebug
        @course = Course.create(course_params)
        redirect_to "/courses/#{@course.id}"
    end

    def edit
        @teachers = Teacher.all
    end

    def update
        @course.update(course_params)
        redirect_to "/courses/#{@course.id}"
    end


    def show

    end

    def services
        @course_ms = Course.most_students
        @course_ma = Course.most_assignments
        @course_h = Course.hardest
        @course_e = Course.easiest
        # byebug
        render :course_services
    end

    def no_students
        @courses = Course.no_students
        render :course_no_students
    end

    def no_assignments
        @courses = Course.no_assignments
        render :no_assignments
    end

    def current_course 
        @course = Course.find(params[:id])
    end

    private

    def course_params
        params.require(:course).permit(:name, :teacher_id)
    end

end
