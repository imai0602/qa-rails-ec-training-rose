Rails.application.routes.draw do
  root to: 'staticpages#home'
  get 'carts/show', to: 'carts#show', as: 'carts_show'
  post 'carts/add_cart', to: 'carts#add_cart'
  patch 'carts/change_quantity', to: 'carts#change_quantity', as: 'change_item_quantity'
  delete 'carts/destroy_carts_item', to: 'carts#destroy_carts_item', as: 'destroy_carts_item'
  get '/perchase_completed/:id', to: 'orders#perchase_completed', as: 'perchase_completed'
  get  'login',   to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'guest_login', to: 'sessions#guest_login'
  resources :products
  resources :users
  resources :orders
end
