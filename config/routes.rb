Rails.application.routes.draw do
  resources :favorite_lands, only: [:index, :create, :destroy]
  resources :profile_lands, only: [:index]
  resources :profiles
  resources :lands 

  get '/lands/:id/show_images', controller: 'lands', action: :show_images, as: :land_show_images
  root "home#index"

  devise_for :users
  devise_scope :user do
    post '/users/sign_out', to: 'devise/sessions#destroy'
  end

end
