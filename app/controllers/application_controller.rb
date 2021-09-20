class ApplicationController < ActionController::Base
  before_action :authenticate_member!,except: [:top, :about]
  before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_member_session_path
  end
end
