Rails.application.routes.draw do
  # get 'courses/index'
  # get 'courses/show'
  # get 'courses/new'
  # get 'courses/create'
  # get 'courses/edit'
  # get 'courses/update'
  # get 'courses/destroy'
  # get 'interests/index'
  # get 'interests/show'
  # get 'interests/new'
  # get 'interests/edit'
  # get 'interests/update'
  # get 'interests/destory'
  # get 'instructors/index'
  # get 'instructors/show'
  # get 'instructors/destroy'
  # get 'instructors/update'
  # get 'instructors/new'
  # get 'instructors/edit'
  # get 'students/index'
  # get 'students/create'
  # get 'students/new'
  # get 'students/show'
  # get 'students/destroy'
  # get 'students/update'
  # get 'students/edit'

  resources :instructors do # /instructors
    resources :courses # /instructors/1/courses
  end

  resources :courses do # /instructors
    resources :students # /instructors/1/courses
  end

  resources :students do
    resources :interests
  end
  
  # resources :students
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'instructors#index'
end
