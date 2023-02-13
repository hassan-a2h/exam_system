# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }

  resources :users, only: %i[index destroy edit update]

  resources :admins, shallow: true do
    resources :subjects, except: :show
  end

  resources :exams
  resources :schedules, except: [:show, :edit]
  resources :results, only: [:index, :show, :create]
  resources :mcqs, only: :destroy
  resources :blanks, only: :destroy
  resources :attempts, only: :show
  resource :dashboard, only: [:show, :new]

  root 'dashboards#show'

  get '*all', to: 'dashboards#new', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
