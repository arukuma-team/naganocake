class Members::MembersController < ApplicationController

  #マイページへのアクション
  def show
    @member = current_member
  end

end
