Rails.application.routes.draw do
  resources :houses
  root "home#index"

  devise_for :users
  devise_scope :user do
    post '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :favorite_lands, only: [:index, :create, :destroy]
  resources :profile_lands, only: [:index]
  resources :profiles
  resources :lands do 
    get 'show_images'
  end

end
