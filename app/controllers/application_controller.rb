class ApplicationController < ActionController::Base
  
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  
   def after_sign_up_path_for(resource)
     profile_users_path(resource)
   end
  
  def after_sign_in_path_for(resource) 
    hotels_top_page_path
  end
  
  def after_sign_out_path_for(resource)
   hotels_top_page_path
  end
  
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:email,:image])
  end
end