Rails.application.routes.draw do
  resources :profile_lands
  resources :lands
  resources :profiles
  root "home#index"

  devise_for :users
  devise_scope :user do
    post '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
