class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_user_profile

	private 

	def get_user_profile
		if current_user
			@current_user_profile = current_user.profile
		end
	end
end
