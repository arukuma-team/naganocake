class Admins::MembersController < ApplicationController
  def index
    @members = Member.all
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
      if @member.update(member_params)
        redirect_to admins_member_path(@member.id)
      else
        render :edit
      end
  end
  
  private

  def member_params
    params.require(:member).permit(:lastname, :firstname, :lastruby, :firstruby, :zip, :address, :tel, :email, :status)
  end
end
