class Student < ApplicationRecord

    has_many :lists
    has_many :courses, through: :lists


    def full_name
        temp = "#{self.first_name} #{self.last_name}"
    end
end
