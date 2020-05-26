class StudentTeacher < ApplicationRecord
belongs_to :teachers 
belongs_to :students
end