Rails.application.routes.draw do
  resources :authentications
  resources :completed_trails
  resources :bucket_lists
  resources :favorites
  resources :users
  
  post "/login", to: 'authentications#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
