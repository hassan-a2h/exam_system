# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    invitations: 'users/invitations'
  }

  resources :users, only: %i[index destroy]

  resources :admins, shallow: true do
    resources :subjects, except: :show
  end

  resources :teachers
  resources :students
  resources :exams do
    collection do
      get :approve
    end

    member do
      post :accept
      post :reject
    end
  end

  resource :dashboard, only: [:show]

  root 'dashboards#show'
end
