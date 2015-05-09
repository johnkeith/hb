class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def index
		@profiles = Profile.includes(:location).order(:updated_at).page(params[:page])
	end

	def show
		@profile = Profile.find(params[:id])
		@profile_user_id = @profile.user.id
		@location = @profile.location

		unless @profile == current_user.profile
			Conversation.find_shared_conversations(@profile_user_id, current_user.id)
		end
	end

	def edit
		@profile = current_user.profile

		redirect_to edit_profile_path(@profile) unless params[:id] == @profile.id.to_s
		
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
