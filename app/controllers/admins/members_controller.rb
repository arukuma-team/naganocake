class Admins::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
	def update
	 @member = Member.find(params[:id])
		if @member.update(member_params)
		   flash[:success] = "会員情報を変更しました"
		   redirect_to admin_member_path
		else
			render "edit"
		end

	end
 
end
