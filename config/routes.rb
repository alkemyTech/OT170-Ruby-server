# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :auth do
        post '/register', to: 'registrations#create'
        post '/login', to: 'sessions#create'
        get '/me', to: 'users#me'
      end

      post '/organizations/public', to: 'organizations#create'

      resources :categories, only: %i[index show create update destroy]
      resources :contacts, only: %i[index create]
      resources :activities, only: %i[index show create update destroy]
      resources :testimonials, only: %i[index show create update destroy]

      resources :news, only: %i[index show create update destroy] do
        resources :comments, only: %i[index show create]
      end

      resources :comments, only: %i[index show update destroy]

      resources :organizations, only: :show do
        get 'public', on: :collection
        resources :slides, only: %i[index]
      end

      resources :slides, only: %i[create show update destroy]
      resources :users, only: %i[index update destroy]

      resources :contacts, only: %i[create]

      resources :members, only: %i[index show create update destroy]
    end
  end
end
