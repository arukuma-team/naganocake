class ApplicationController < ActionController::Base
  before_action :authenticate_member!,except: [:top, :about]
  before_action :authenticate_admin!,except: [:top, :about]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_member_session_path
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