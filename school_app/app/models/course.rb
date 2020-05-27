class Course < ApplicationRecord
    belongs_to :teacher
    has_many :assignments
    has_many :lists
    has_many :students, through: :lists
end
