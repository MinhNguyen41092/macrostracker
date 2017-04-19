Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: "sessions",
      	registrations: "registrations"
      }
      
      root to: "api/v1/home#index"
      resources :users, only: [:show]
      resources :informations, except: [:index]
      post "informations/create"
    end
  end
end
