Rails.application.routes.draw do
  get  '/login',   to: 'sessions#new'
  resources :products
  resources :users
  resources :orders
end
