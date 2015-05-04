class ProfilesController < ApplicationController
	before_action :authenticate_user!

	before_filter :get_location_user_profile, only: [:show, :edit]

	def get_location_user_profile
		@user 		= current_user
		@location = current_user.location
		@profile 	= current_user.profile
	end

	def index
	end

	def new
	end

	def create
	end

	def show
	end

	def edit
		@location ||= Location.new
	end

	def update
		@profile = current_user.profile
		
		respond_to do |f|
			if @profile.update_attributes(profile_params)
				f.json { render json: @profile, status: 200 }
			else
				f.json { render json: @profile.errors.full_messages, status: 422 }
			end
		end
	end

	def destory
	end
	
	private

	def profile_params
		params.require(:profile).permit(:age)
	end

end
