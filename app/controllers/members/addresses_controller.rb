class Members::AddressesController < ApplicationController
  
   before_action :authenticate_member!
  
  def index
      @addresses = current_member.address
      @newaddress = Address.new
  end
  
  def create
      @newaddress = Address.new(address_paramas)
      @address.member_id = current_member.id
      @addresses = current_member.address
      @address.save
          flash[:notice] = "新規配送先を登録しました"
          redirect_to "/members/addresses"
  end
  
  def edit
      @address = Address.find(params[:id])
  end
  
  def update
      @address = Address.find(params[:id])
    if @address.update(address_paramas)
        flash[:notice] = "配送先を変更しました"
        redirect_to " /members/addresses"
    else
        render "edit"
    end
  end
  
  def destroy
      @address = Address(params[:id])
      @address.destroy
      @addresses = current_member.address
      flash[:notice] = "配送先を削除しました"
  end
  
  private

 def address_params
   params.require(:address).permit(:zip, :address, :name)
 end
  
end
