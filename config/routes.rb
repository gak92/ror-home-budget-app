Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users
  resources :categories do
    resources :payments
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
end
