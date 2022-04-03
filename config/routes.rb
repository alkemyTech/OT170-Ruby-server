Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :auth do
        post '/register', to: 'registrations#create'
        post '/login', to: 'sessions#create'
      end

      get '/organizations/public', to: 'organizations#public'

    end
  end
end
