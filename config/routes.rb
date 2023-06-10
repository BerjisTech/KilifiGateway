# frozen_string_literal: true

Rails.application.routes.draw do
  get 'commons/search'
  get 'tezo/center'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'tezo#center'

  # SEARCH
  get 'search', controller: 'commons', action: 'search'
end
