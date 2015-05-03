class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	private 
  
  def get_referrer_params
		Rails.application.routes.recognize_path(request.referrer)
	end

	def set_referrer_params
		@referrer_params = get_referrer_params
	end

	def get_location_user_profile
		@user 		= current_user
		@location = current_user.location
		@profile 	= current_user.profile
	end
end
