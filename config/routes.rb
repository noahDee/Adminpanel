Rails.application.routes.draw do

  # root '/login'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/student', to: 'students#edit'
  get '/instructor', to: 'instructors#edit'
  get '/add-student', to: 'students#new'
  post '/add-student', to: 'students#create'
  get '/add-instructor', to: 'instructors#new'
  post '/add-instructor', to: 'instructors#create'
  get '/admin', to: 'student#edit'
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
