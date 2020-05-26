class Student < ApplicationRecord
    has_many :students_teachers
    has_many :teachers, through: :students_teachers


    def full_name
        temp = "#{self.first_name} #{self.last_name}"
    end
end
