Rails.application.routes.draw do

  resources :courses do
    resources :assessmentitems
    
  end
  resources :students
  resources :instructors
  root :to => redirect('/home')
  
    get '/instructor_homepage' => 'sessions#instructor_homepage'
    get '/student_homepage' => 'sessions#student_homepage'
    get  '/login' => 'sessions#new' 
    get  '/home' => 'sessions#home' 
    get '/courses/:course_id/index_students' => 'courses#index_students'
    get '/courses/:course_id/add_student' => 'courses#add_student'
    get '/courses/:course_id/remove_student' => 'courses#remove_student'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
    get  '/courses/:course_id/student/:student_id/grades' => 'grades#index'
    get  '/courses/:course_id/student/:student_id/grades/new' => 'grades#new'
    post  '/courses/:course_id/student/:student_id/grades' => 'grades#create'
    get  '/courses/:course_id/student/:student_id/grades/:id/edit' => 'grades#edit'
    put  '/courses/:course_id/student/:student_id/grades/:id' => 'grades#update'
    delete  '/courses/:course_id/student/:student_id/grades/:id' => 'grades#destroy'
end



