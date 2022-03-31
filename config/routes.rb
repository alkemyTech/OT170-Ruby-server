Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :auth do
        post '/register', to: 'registrations#create'
      end
    end
  end

  namespace :auth do
    post 'login', to: 'sessions#create'
  end
end
