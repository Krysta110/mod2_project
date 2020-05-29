Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


resources :students, :teachers, :courses, :assignments

get '/home', to: 'application#home', as: :home

get '/teachers/:id/list_all_my_students', to: 'teachers#list_all_my_students', as: :list_all_my_students
get '/teacher/services', to: 'teachers#services', as: :services
get '/teacher/no_courses', to: 'teachers#no_courses', as: :no_courses

get '/students/:id/list_all_my_teachers', to: 'students#list_all_my_teachers', as: :list_all_my_teachers
get '/student/services', to: 'students#services', as: :student_services
get '/student/no_courses', to: 'students#no_courses', as: :student_no_courses


get '/course/services', to: 'courses#services', as: :course_services
get '/course/no_students', to: 'courses#no_students', as: :course_no_students
get '/course/no_assignments', to: 'courses#no_assignments', as: :no_assignments


end
