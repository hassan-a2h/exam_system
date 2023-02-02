# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    invitations: 'users/invitations'
  }

  resources :users, only: %i[index destroy edit update]

  resources :admins, shallow: true do
    resources :subjects, except: :show
  end

  resources :exams do
    collection do
      get :approve
    end

    member do
      post :accept
      post :reject
    end
  end
  resources :schedules do
    member do
      post :accept
      post :reject
    end
  end

  resources :results
  resources :attempts, only: :show
  resource :dashboard, only: [:show]

  root 'dashboards#show'
end
