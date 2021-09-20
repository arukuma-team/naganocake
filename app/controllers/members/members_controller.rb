class Members::MembersController < ApplicationController

    
  def edit
    @member = Member.find(params[:id])
      if @member != current_user
         redirect_to edit_members_member_path(current_user.id)
      end
  end
  
  def update
    @member = Member.find(params[:id])
      if @member.update(member_params)
        redirect_to members_member_path(current_user.id)
      else
        render :edit
      end
  end
  
  def show
    @member = current_member
  end
  
end

private

def member_params
  params.require(:member).permit(:lastname, :firstname, :lastruby, :firstruby, :zip, :address, :tel, :email)
end