Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'landing#index'

  resources :profiles do
  	member do
			post '/edit_location', to: 'locations#create_or_associate', as: :edit_location
		end
	end

	get '/edit_profile', to: 'profiles#edit', as: :edit_current_user_profile

	post '/start_conversation', to: 'conversations#create', as: :create_conversation
	post '/add_to_conversation', to: 'conversations#update', as: :update_conversation
end
