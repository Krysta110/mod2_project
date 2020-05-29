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

    def self.most_assignments
        temp = " "
        temp_count = 0
        self.all.each do |course|
            if course.assignments.count > temp_count
                temp_count = course.assignments.count
                temp = course
            end
        end
        temp
    end
    


    def self.no_assignments
        temp = []
        self.all.each do |course|
            if course.assignments.count == 0
                temp << course
            end
        end
        temp
    end 

    def self.hardest
        temp = "n/a"
        temp_avg = 0
        self.all.each do |course|
            sum = 0
            if course.assignments.length != 0
                course.assignments.each do |a|
                    sum += a.difficulty
                end 
                avg = (sum / course.assignments.length).to_f
                if avg > temp_avg
                    temp_avg = avg 
                    temp = course
                end
            end
        end
        temp
    end



    def self.easiest
        temp = "n/a"
        temp_avg = 10
        self.all.each do |course|
            sum = 0
            if course.assignments.length != 0
                course.assignments.each do |a|
                    sum += a.difficulty
                end 
                avg = (sum / course.assignments.length).to_f
                if avg < temp_avg
                    temp_avg = avg 
                    temp = course
                end
            end
        end
        temp
    end
    # def avg_difficulty
    #     sum = 0
    #     self.assignments.each do |a|
    #         sum += a.difficulty 
    #     end 
    #     (sum / self.assignments.length).to_f
    # end

    # def self.hardest
    #     self.all.max_by{|a| a.avg_difficulty}
    # end 

    # def self.easiest
    #     self.all.min_by{|a| a.avg_difficulty}
    # end



end
