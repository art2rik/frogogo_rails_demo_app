Rails.application.routes.draw do
  root :to => "home#index"
  get 'login', to: "home#login"

  devise_for :admins
  resources :users

  namespace :api do
    post 'users/register', to: "users#register"
    get 'users/index', to: "users#index"
    post 'users/update', to: "users#update"
    get 'users/view(/:id)', to: "users#view"
    get 'users/list', to: "users#list"
  end
end
