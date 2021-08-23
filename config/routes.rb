Rails.application.routes.draw do
  devise_for :users
  get '/home', to: "homes#index"
  root to: "homes#index"
  # get '/user/id/main', to: "users#main"

  resources :plants
end
