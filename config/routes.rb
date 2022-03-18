Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post :users, to: 'users#create', path: 'auth/register'
      get :users, to: 'users#index'
      post :login, to: 'authentication#create'
    end
  end
end
