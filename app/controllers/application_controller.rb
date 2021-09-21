class ApplicationController < ActionController::Base
  before_action :authenticate_member!,except: [:top, :about]
  before_action :authenticate_admin!,except: [:top, :about]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resouce)
    root_path
  end
  
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :lastname, :firstname, :lastruby, :firstruby, :zip, :address, :tel])
  end
end