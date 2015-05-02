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
	end

	def update
	end

	def destory
	end

	private :get_location_user_profile
end
