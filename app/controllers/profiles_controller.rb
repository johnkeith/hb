class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def show
	end

	def edit
		@location = current_user.location || Location.new
	end

	def update		
		respond_to do |f|
			if @profile.update_attributes(profile_params)
				f.json { render json: @profile, status: 200 }
			else
				f.json { render json: @profile.errors.full_messages, status: 422 }
			end
		end
	end

	# def destory
	# end
	
	private

	def profile_params
		params.require(:profile).permit(:first_name, :last_name,
			:personal_description, :city_description, :age)
	end
end
