Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'pages#blank'
  # resources :admins

  namespace :admin do
      resources :students, only: [:new, :create, :index, :edit, :update, :destroy, :show]
      resources :instructors, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :cohorts, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      resources :courses, only: [:new, :create, :edit, :update, :destroy, :index, :show]
      get '/cohorts/:id/add-students', to: 'cohorts#add_students'
  end

  resources :cohorts, only: [:show, :index]
  resources :courses, only: [:show, :index]
  resources :instructors, only: [:show, :index]
  resources :students, only: [:show]

  scope '/student' do
  get '/home', to: 'students#home', as: :student_home
  get '/edit', to: 'students#edit'
  patch '/edit', to: 'students#update', as: :edit_student
  end

  scope '/instructor' do
  get '/home', to: 'instructors#home', as: :instructor_home
  get '/edit', to: 'instructors#edit'
  patch '/edit', to: 'instructors#update', as: :edit_instructor
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
