class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :status)#ジャンル未実装
  end

end
