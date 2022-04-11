# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :activities, only: %i[create]
      namespace :auth do
        post '/register', to: 'registrations#create'
        post '/login', to: 'sessions#create'
      end

      resources :categories, only: %i[index show create update destroy]

      resources :news, only: %i[show create update destroy]

      resources :organizations, only: :show do
        get 'public', on: :collection
        resources :slides, only: :index
      end

      resources :users, only: %i[index destroy]
    end
  end
end
