Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "items#index"
  resources :users, only: [:new, :create]
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
