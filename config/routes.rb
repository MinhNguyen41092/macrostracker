Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: "sessions",
  	registrations: "registrations"
  }
  
  resources :users, only: [:show]
  resources :informations, except: [:index]
  post "informations/create"
    
  root to: "home#index"
end
