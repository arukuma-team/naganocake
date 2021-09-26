class ApplicationController < ActionController::Base


before_action :authenticate_any!,except: [:top, :about]



protected

  def authenticate_any!
    if admin_signed_in?
      true
    else
      authenticate_member!
    end
  end



  def after_sign_in_path_for(resource)
    case resource
    when Member
      root_path
    when Admin
      admins_orders_path
    end

  end

  def after_sign_out_path_for(resouce)
    root_path
  end

   before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :lastname, :firstname, :lastruby, :firstruby, :zip, :address, :tel])
  end
  
  


  # def current_order
  #   Order.find(session[:order_id])
  # rescue ActiveRecord::RecordNotFound
  #   order = Order.create
  #   session[:order_id] = order.id
  #   order
  # end
  #　↑　rails sをしたときにエラーが出るので取り合えず、コメントにしときます。
end

