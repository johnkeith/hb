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
			shared_conversation_ids = UserConversation.where(user_id: [@profile_user_id, current_user.id])
				.pluck(:conversation_id).instance_eval { detect { |c| count(c) > 0 } }
			@conversations = Conversation.where(id: shared_conversation_ids)
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
