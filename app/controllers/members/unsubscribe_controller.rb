class Members::UnsubscribeController < ApplicationController
  def quit
    @member = Member.find(params[:id])
  end

  def out
    @member = Member.find_by(params[:id])
    @member.discard
    reset_session
    redirect_to root_path
  end
end
