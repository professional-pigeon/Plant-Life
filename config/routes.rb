Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get '/home', to: "homes#index"
  root to: "homes#index"
  get '/plants/tasks', to: "plants#tasks"
  post '/plants/:id/water_update', to: "plants#water_update"
  resources :plants
end
