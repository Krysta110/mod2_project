class Assignment < ApplicationRecord
    belongs_to :course
    validates :difficulty, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

end
