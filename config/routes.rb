# frozen_string_literal: true

Rails.application.routes.draw do
  get 'operations_room/command_center'
  get 'operations_room/stores'
  get 'operations_room/branches'
  get 'operations_room/products'
  get 'operations_room/services'
  get 'operations_room/on_demand_services'
  get 'operations_room/treasury'
  get 'operations_room/support'
  
  # Defines the root path route ("/")
  root 'tezo#center'

  # User auth
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  # Resources
  resources :searches
  resources :government_facilities
  resources :accepted_currencies
  resources :transactions
  resources :on_demand_services
  resources :service_variants
  resources :services
  resources :product_variants
  resources :branches
  resources :products
  resources :store_contacts
  resources :staffs
  resources :stores
  resources :accomodations
  resources :service_providers
  resources :wallets
  resources :owners
  get 'commons/search'
  get 'tezo/center'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
