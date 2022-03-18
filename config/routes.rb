Rails.application.routes.draw do
  resources :testimonials
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
    end
  end
end
