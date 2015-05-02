class LocationsController < ApplicationController
	def new
	end

	def create
		@location = Location.new(location_params)

		referrer_params = get_referrer_params
		
		if referrer_params[:controller] == 'profiles'
			if @location.save
				@profile = Profile.find_by(id: referrer_params[:id])

				@profile.user.update_attributes(location_id: @location.id)

				redirect_to profile_path(referrer_params[:id])
			else
				redirect_to edit_profile_path(referrer_params[:id])
			end
		else
			redirect_to root_path
		end
	end

	def update
	end

	private

	def location_params
		params.require(:location).permit(:city, :state, :country)
	end

	def get_referrer_params
		Rails.application.routes.recognize_path(request.referrer)
	end
end