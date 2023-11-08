Rails.application.routes.draw do
  
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
    end
  
  end

  root "home#index"

end
