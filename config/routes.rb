# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post '/organizations/public', to: 'organizations#create'
      namespace :auth do
        post '/register', to: 'registrations#create'
        post '/login', to: 'sessions#create'
      end

      resources :categories, only: %i[index show create update destroy]
      resources :activities, only: %i[index show create update destroy]

      resources :news, only: %i[show create update destroy]

      resources :organizations, only: :show do
        get 'public', on: :collection
        resources :slides, only: %i[index update destroy]
      end

      resources :users, only: %i[index destroy]

      resources :contacts, only: %i[create]

      resources :members, only: %i[index show create update destroy]
    end
  end
end
