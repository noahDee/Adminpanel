Rails.application.routes.draw do
  root 'pages#home'
  resources :cohorts
  resources :courses
  resources :instructors
  resources :students
  get 'pages/sign_in'
  get 'cohort/index'
  get 'cohort/edit'
  get 'cohort/new'
  get 'cohort/show'
  get 'course/index'
  get 'course/edit'
  get 'course/new'
  get 'course/show'
  get 'instructor/index'
  get 'instructor/edit'
  get 'instructor/new'
  get 'instructor/show'
  get 'student/index'
  get 'student/edit'
  get 'student/new'
  get 'student/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
