class Course < ApplicationRecord
    belongs_to :teacher
    has_many :assignments
    has_many :lists
    has_many :students, through: :lists






    def self.most_students
        temp = " "
        temp_count = 0
        self.all.each do |course|
            if course.students.count > temp_count
                temp_count = course.students.count
                temp = course
            end
        end
        temp
    end


    def self.no_students
        temp = []
        self.all.each do |course|
            if course.students.count == 0
                temp << course
            end
        end
        temp
    end



end
