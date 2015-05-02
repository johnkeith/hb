Rails.application.routes.draw do
  devise_for :users
  root to: 'landing#index'

  resources :profiles
end
