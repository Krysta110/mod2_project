class Student < ApplicationRecord

    has_many :lists
    has_many :courses, through: :lists
    validates :age, numericality: {greater_than_or_equal_to: 14, less_than_or_equal_to: 20}
    validates :grade_level, numericality: {greater_than_or_equal_to: 9, less_than_or_equal_to: 12}

    def full_name
        temp = "#{self.first_name} #{self.last_name}"
    end

    def self.most_courses
        temp = " "
        temp_count = 0
        self.all.each do |student|
            if student.courses.count > temp_count
                temp_count = student.courses.count
                temp = student 
            end
        end
        temp
    end

    def self.no_courses
        temp = []
        self.all.each do |student|
            if student.courses.count == 0
                temp << student 
            end
        end
        temp
    end

    def list_all_my_teachers
        all_teachers = []
        self.courses.each do |course|
                all_teachers << course.teacher.full_name
        end
        all_teachers.uniq
    end


end
