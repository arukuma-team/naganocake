class Members::CartItemsController < ApplicationController
  before_action :setup_cart_item!, only: [:create, :update, :destroy, :destroy_all]

  def index
    @cart_items = current_order.cart_items
  end

  def create
    if @cart_item.blank?
      @cart_item = current_order.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.piece += params[:piece].to_i
    @cart_item.save
    redirect_to '/members/cart_items'
  end

  def update
    @cart_item.update(piece: params[:piece].to_i)
    redirect_to '/members/cart_items'
  end

  def destroy
    @cart_item.destroy
    flash[:notice] = 'カート内の商品が削除されました'
    redirect_to '/members/cart_items'
  end
  
  def destroy_all
    @cart_item.destroy_all
    flash[:notice] = 'カート内が空になりました'
    redirect_to '/members/cart_items'
  end

  private

  def setup_cart_item!
    @cart_item = current_order.cart_items.find_by(item_id: params[:item_id])
  end

# 参考資料： https://qiita.com/Doppon/items/3947c0027d9ea555cc39 /  https://zenn.dev/akhmgc/articles/2d060378c4260e 
  
end
