Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "sessions",
  	registrations: "registrations"
  }
  
  root to: "home#index"
  resources :users, only: [:show]
  resources :informations, except: [:index]
  post "informations/create"
end
