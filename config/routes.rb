Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root "home#splash"
  resources :home, :only => [:splash, :index]
  resources :users
  resources :products
  resources :orders
  resources :order_items
  resource :cart, only: [:show]

end
