class Members::CartItemsController < ApplicationController

  def index
    @cart_items = current_member.cart_items
    @sum = 0
  end

  def create
    @cart_item = current_member.cart_items.new(cart_item_params)
    @cart_items = current_member.cart_items
      if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.piece += params[:cart_item][:piece].to_i
        cart_item.save
        @cart_item.delete
      end
    @cart_item.save
    redirect_to members_cart_items_path
  end

  def update
    @cart_items = current_member.cart_items
    @cart_item = @cart_items.find(params[:id])
    @cart_item.update(piece: params[:piece].to_i)
    redirect_to '/members/cart_items'
  end

  def destroy
    @cart_items = current_member.cart_items
    @cart_item = @cart_items.find(params[:id])
    @cart_item.destroy
    flash[:notice] = 'カート内の商品が削除されました'
    redirect_to '/members/cart_items'
  end

  def destroy_all
    @cart_items = current_member.cart_items
    @cart_items.destroy_all
    flash[:notice] = 'カート内が空になりました'
    redirect_to '/members/cart_items'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:member_id, :item_id, :piece)
  end
# 参考資料： https://qiita.com/Doppon/items/3947c0027d9ea555cc39 /  https://zenn.dev/akhmgc/articles/2d060378c4260e

end
