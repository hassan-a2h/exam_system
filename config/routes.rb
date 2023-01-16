# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :admins
  resources :teachers
  resources :students

  resource :dashboard, only: [:show]

  root 'dashboards#show'
  # root path
  # devise_scope :user do
  #   root 'devise/sessions#new'
  #   # unauthenticated do
  #   #   root to: "devise/sessions#new"
  #   # end

  #   # authenticated :user do
  #   #   root to: "devise/sessions#new"
  #   #   # case current_user.type
  #   #   # when 'Admin'
  #   #   #   redirect_to admins_path
  #   #   # when 'Teacher'
  #   #   #   redirect_to teachers_path
  #   #   # else
  #   #   #   redirect_to students_path
  #   #   # end
  #   # end
  # end
end
