# frozen_string_literal: true

Rails.application.routes.draw do
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
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'tezo#center'
end
