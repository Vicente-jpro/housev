Rails.application.routes.draw do
  resources :profile_lands, only: [:index]
  
  resources :lands 
  get '/lands/:id/show_images', controller: 'lands', action: :show_images
  

  resources :profiles

  root "home#index"

  devise_for :users
  devise_scope :user do
    post '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
