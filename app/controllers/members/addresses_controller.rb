class Members::AddressesController < ApplicationController

   before_action :authenticate_member!

  def index
      @addresses = current_member.address
      @address = Address.new
  end


  def create
      @address = Address.new(address_params)
      @address.member_id = current_member.id
      @addresses = current_member.address
       if @address.save
          flash[:notice] = "新規配送先を登録しました"
          redirect_to "/members/addresses"
       else
          @addresses = current_member.address
          flash[:notice] = "登録に失敗しました。もう１度入力をお願いします"
          redirect_to "/members/addresses"
       end
  end

  def edit
      @address = Address.find(params[:id])
  end

  def update
      @address = Address.find(params[:id])
    if @address.update(address_params)
        flash[:notice] = "配送先を変更しました"
        redirect_to "/members/addresses"
    else
        render "edit"
    end
  end

  def destroy
      @address = Address.find(params[:id])
      @address.destroy
      @addresses = current_member.address
      flash[:notice] = "配送先を削除しました"
      redirect_to "/members/addresses"
  end

  private

 def address_params
   params.require(:address).permit(:zip, :address, :name)
 end

end
