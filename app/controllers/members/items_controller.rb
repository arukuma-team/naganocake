class Members::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @categories = Category.all
  end
  
  def show
    @item = Item.find(params[:id])
     @categories = Category.all
  end
  
end
