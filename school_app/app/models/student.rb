class Student < ApplicationRecord

    has_many :lists
    has_many :courses, through: :lists
    validates :age, numericality: {greater_than_or_equal_to: 16, less_than_or_equal_to: 20}
    validates :grade_level, numericality: {greater_than_or_equal_to: 10, less_than_or_equal_to: 12}

    def full_name
        temp = "#{self.first_name} #{self.last_name}"
    end
end
