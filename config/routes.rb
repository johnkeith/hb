Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'landing#index'

  resources :profiles
  resources :locations, only: [:new, :create, :edit, :update]
end
