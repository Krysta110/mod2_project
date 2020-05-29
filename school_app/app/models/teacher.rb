class Teacher < ApplicationRecord
    has_many :courses
    has_many :assignments, through: :courses

    def full_name
        temp = "#{self.first_name} #{self.last_name}"
    end

    def self.most_courses
        temp = " "
        temp_count = 0
        self.all.each do |teach|
            if teach.courses.count > temp_count
                temp_count = teach.courses.count
                temp = teach
            end
        end
        temp
    end

    def self.no_courses
        temp = [ ]
        self.all.each do |teach|
            if teach.courses.count == 0
                temp << teach
            end
        end
        temp.uniq
    end

    def self.most_students
        temp = " "
        temp_count = 0
        self.all.each do |teach|
            teacher_student_count = 0
            teach.courses.each do |course|
                teacher_student_count += course.students.count
            end
            if teacher_student_count > temp_count
                temp_count = teacher_student_count
                temp = teach
            end

        end
        temp
    end

    def find_all_my_students
        all_students = []
        self.courses.each do |course|
            course.students.each do |student|
                all_students << student
            end
        end
        all_students.uniq
    end

end
