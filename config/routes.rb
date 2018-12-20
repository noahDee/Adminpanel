Rails.application.routes.draw do
  get 'students/index'
  get 'students/edit'
  get 'students/new'
  get 'students/show'
  get 'instructors/index'
  get 'instructors/edit'
  get 'instructors/new'
  get 'instructors/show'
  get 'courses/index'
  get 'courses/edit'
  get 'courses/new'
  get 'courses/show'
  get 'cohorts/index'
  get 'cohorts/edit'
  get 'cohorts/new'
  get 'cohorts/show'
  root 'pages#home'
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students
  get 'pages/sign_in'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
