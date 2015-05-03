class LocationsController < ApplicationController
	
	def create_or_associate
		@location = Location.find_by(location_params)
		
		unless @location # a location was found matching the submitted params
			@location = Location.create(location_params)
		end
		
		respond_to do |f|
			if associate_location_and_user(@location, current_user)
				f.json { render json: @location, status: 200 }
			else
				f.json { render json: current_user.errors.full_messages, status: 422 }
			end
		end
	end

	private

	def location_params
		params.require(:location).permit(:city, :state, :country)
	end

	def associate_location_and_user(location, user)
		user.update_attributes(location_id: location.id)
	end
end