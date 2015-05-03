class LocationsController < ApplicationController
	def new
	end

	def create
		@location = Location.new(location_params)

		respond_to do |f|
			if @location.save
				f.json { render json: @location, status: 200 }
			else
				f.json { render json: @location.errors.full_messages, status: 422 }
			end
		end
	end

	def update
		@location = Location.find_by(id: params[:id])

		respond_to do |f|
			if @location.update_attributes(location_params)
				f.json { render json: @location, status: 200 }
			else
				f.json { render json: @location.errors.full_messages, status: 422 }
			end
		end
	end

	private

	def location_params
		params.require(:location).permit(:city, :state, :country)
	end
end