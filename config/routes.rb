Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'landing#index'

  resources :profiles
  # resources :locations, only: [:create, :update]
  post '/edit_profile_location', to: 'locations#create_or_associate', as: :edit_profile_location

  # get '/edit_personal_information', to: 'personal_information#edit', as: :edit_personal_information
end
