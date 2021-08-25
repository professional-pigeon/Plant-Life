Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  get 'users/profile', to: 'users#profile'
  get '/home', to: "homes#index"
  root to: "homes#index"
  get '/plants/tasks', to: "plants#tasks"
  post '/plants/:id/water_update', to: "plants#water_update"
  get 'home/test', to: "homes#test"
  resources :plants

  #for messages
  resources :users do
    get :profile
    resources :messages, only: [:new, :create, :profile] #-> domain.com/users/:user_id/messages/new
  end
    resources :messages, only: [:index, :show, :destroy] do
      # post "/users/:id/messages/new" => 'message#create'
    end
end
