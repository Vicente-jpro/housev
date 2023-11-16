require 'resque/server'

Rails.application.routes.draw do
  
  mount Resque::Server.new, :at => "/resque"

  resources :favorite_lands, only: [:index, :create, :destroy]
  resources :favorite_houses, only: [:index, :create, :destroy]
  resources :profile_lands, only: [:index]
  resources :profiles


  devise_for :users
  devise_scope :user do
    post '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :lands do 
    get 'show_images'
  end
  
  resources :houses do
    get 'show_images' 
    
    collection do
      get 'search'
      get 'search_advanced'
    end
  
  end

  root "home#index"

end
