class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
  	flash[:notice] = "Your account has been created! Now please fill out your profile information."
    edit_profile_path(resource.id)
  end
end