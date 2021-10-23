class Members::UnsubscribeController < ApplicationController
  def quit
    @member = current_member
  end

  def out
    @member = current_member
    @member.update(status: true)
    reset_session
    redirect_to root_path
  end
end
