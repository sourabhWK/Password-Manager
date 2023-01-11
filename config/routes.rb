Rails.application.routes.draw do
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "user_home", to: "sessions#index"

  delete "logout", to: "sessions#destroy"

  resources :credentials

  root "main#index"

end
