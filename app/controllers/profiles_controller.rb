class ProfilesController < ApplicationController
	before_action :authenticate_user!

	def index
		@profiles = Profile.includes(:location).order(:updated_at).page(params[:page])
	end

	def show
		@profile = Profile.find(params[:id])
		@profile_user_id = @profile.user.id
		@location = @profile.location
		@current_users_profile = @profile == current_user.profile
		
		unless @current_users_profile
			@conversations = Conversation.find_shared_conversations(@profile_user_id, current_user.id)
		end
	end

	def edit
		if params[:id] && params[:id] != @current_user_profile.id.to_s
			redirect_to edit_profile_path(@current_user_profile) 
		end
		
		@location = current_user.location || Location.new
		
		respond_to do |format|
			format.html
		end
	end

	def update
		respond_to do |f|
			if @current_user_profile.update_attributes(profile_params)
				flash.now[:success] = "You successfully updated your profile information!"
				f.json { render json: @current_user_profile, status: 200 }
			else
				f.json { render json: @current_user_profile.errors.full_messages, status: 422 }
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
