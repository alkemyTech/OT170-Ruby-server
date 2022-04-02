# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :auth do
        post '/register', to: 'registrations#create'
        post '/login', to: 'sessions#create'
      end

      resources :categories, only: %i[update destroy]

      resources :organizations, only: :show do
        get 'public', on: :collection
        resources :slides, only: :index
      end

      resources :users, only: %i[index destroy]
    end
  end
end
