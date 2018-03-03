Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  resources :customers

  root 'orders#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
