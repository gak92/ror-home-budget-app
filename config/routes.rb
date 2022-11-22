Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  
  resources :users
  resources :categories do
    resources :payments
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
