class ApplicationController < ActionController::Base

  #before_action :authenticate_member!,except: [:top, :about]
  #before_action :authenticate_admin!,except: [:top, :about]

protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_orders_path
    when Member
      root_path
    end

  end

  def after_sign_out_path_for(resouce)
    root_path
  end

   before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :lastname, :firstname, :lastruby, :firstruby, :zip, :address, :tel])
  end
end
