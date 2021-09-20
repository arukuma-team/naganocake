class Members::UnsubscribeController < ApplicationController
  def quit
    @member = Member.find_by(params[:id])
  end

  def out
    @member = Member.find_by(params[:id])
    @member.discard
    redirect_to root_path
  end
end
