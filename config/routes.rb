Rails.application.routes.draw do
  get  'login',   to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'guest_login', to: 'sessions#guest_login'
  resources :products
  resources :users
  resources :orders
end
