Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: "sessions",
  	registrations: "registrations",
  	omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  resources :users, only: [:show]
  resources :informations
    
  root to: "home#index"
end
