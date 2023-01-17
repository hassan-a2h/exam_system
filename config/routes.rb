# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    invitations: 'users/invitations'
  }

  resources :admins
  resources :teachers
  resources :students

  resource :dashboard, only: [:show]

  root 'dashboards#show'
end
