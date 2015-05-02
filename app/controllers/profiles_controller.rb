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
		if @profile.update_attributes(profile_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destory
	end

	private :get_location_user_profile
	
	private

	def profile_params
		params.require(:profile).permit(:age)
	end

end
