class Teacher < ApplicationRecord
    has_many :courses
    has_many :assignments, through: :courses

    def full_name
        temp = "#{self.first_name} #{self.last_name}"
    end
end
