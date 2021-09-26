class Members::ItemsController < ApplicationController

  def index
    @items = Item.all
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
