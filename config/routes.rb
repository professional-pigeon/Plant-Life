Rails.application.routes.draw do
  devise_for :users
  get '/home', to: "homes#index"
  root to: "homes#index"
  get '/plants/water', to: "plants#water"
  post '/plants/:id/water_update', to: "plants#water_update"
  resources :plants
end
