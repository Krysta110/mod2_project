class Teacher < ApplicationRecord
    has_many :courses
    has_many :students_teachers
    has_many :students, through: :students_teachers



    def full_name
        temp = "#{self.first_name} #{self.last_name}"
    end
    
end
