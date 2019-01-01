Rails.application.routes.draw do
  get '/admin', to: 'admins#show'
  get '/student-home', to: 'students#home'
  get '/instructor-home', to: 'instructors#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/student', to: 'students#show'
  get '/instructor', to: 'instructors#show'

  get '/add-student', to: 'students#new'
  post '/add-student', to: 'students#create', as: :create_student
  get '/add-instructor', to: 'instructors#new'
  post '/add-instructor', to: 'instructors#create', as: :create_instructor
  get '/add-course', to: 'courses#new'
  post '/add-course', to: 'courses#create', as: :create_course
  get '/add-cohort', to: 'cohorts#new'
  post '/add-cohort', to: 'cohorts#create', as: :create_cohort

  get '/all-students', to: 'students#index'
  get '/all-instructors', to: 'instructors#index'
  get '/all-courses', to: 'courses#index'
  get '/all-cohorts', to: 'cohorts#index'

  get 'student/:id', to: 'students#show'
  get 'instructor/:id', to: 'instructors#show'
  get '/course/:id', to: 'courses#show'
  get '/cohort/:id', to: 'cohorts#show'


  resources :cohorts, only: [:show, :index]
  resources :courses, only: [:show, :index]
  resources :instructors, only: [:show, :index]
  resources :students, only: [:show, :index]
  resources :sessions
  resources :admins do
    resources :cohorts, only: [:update, :destroy, :edit, :create, :new]
    resources :courses, only: [:update, :destroy, :edit, :create, :new]
    resources :instructors, only: [:update, :destroy, :edit, :create, :new]
    resources :students, only: [:update, :destroy, :edit, :create, :new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
