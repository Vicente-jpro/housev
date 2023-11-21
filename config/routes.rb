require 'resque/server'

Rails.application.routes.draw do
  
  mount Resque::Server.new, :at => "/resque"

  resources :favorite_lands, only: [:index, :create, :destroy]
  resources :favorite_houses, only: [:index, :create, :destroy]
  resources :profile_lands, only: [:index]
  resources :profiles


  devise_for :users, controllers: {registrations: "registrations"}

  devise_scope :user do
    post '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :lands do 
    get 'show_images'

    collection do 
      get 'search'
      get 'publisher'
    end
  end
  
  resources :houses do
    get 'show_images' 
    
    collection do
      get 'search'
      get 'search_advanced'
      get 'publisher'
    end
  
  end

  root "home#index"

end
