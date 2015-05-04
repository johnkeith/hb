Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'landing#index'

  resources :profiles do
  	member do
			post '/edit_location', to: 'locations#create_or_associate', as: :edit_location
		end
	end
end
