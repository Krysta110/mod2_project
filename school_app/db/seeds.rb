# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all 
Teacher.destroy_all 
Course.destroy_all 

25.times do (
    Student.create(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, age: rand(14..18), gender: "female", grade_level: rand(9..12))
)
end

25.times do (
    Student.create(first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, age: rand(14..18), gender: "male", grade_level: rand(9..12))
)
end

10.times do (
    Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
)
end

teachers = Teacher.all

Course.create(name: "Math 09", teacher_id: teachers.ids.sample)
Course.create(name: "Math 10", teacher_id: teachers.ids.sample)
Course.create(name: "Math 11", teacher_id: teachers.ids.sample)
Course.create(name: "Math 12", teacher_id: teachers.ids.sample)




# Faker::Date.between(from: 2.days.ago, to: Date.today)