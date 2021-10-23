class Members::ItemsController < ApplicationController

  def index
    @items = Item.paginate(page: params[:page], per_page: 2)
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
