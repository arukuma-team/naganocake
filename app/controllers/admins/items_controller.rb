class Admins::ItemsController < ApplicationController
  
  def index
    @categories = Category.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to admins_items_path(@item)
    else
     render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to admins_item_path(@item)
      else
        render :edit
      end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admins_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :status, :picture, :category_id)#ジャンル未実装
  end

end
