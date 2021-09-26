class Members::OrdersController < ApplicationController
  
  def index
    @orders = current_member.orders.all
    # page(params[:page]).per(6).order(created_at: 'DESC')
  end
  
  def new
    @order = Order.new
    @member = Member.all
    @addresses = current_member.addresses
  #  ↑メールアドレスを表記させるのに必要なので
  end
  
  def confirm
    #@cart_items = current_member.cart_items
    @order = Order.new(order_params)
    @order.shipping_fee = 300
    @order.payment_method = params[:order][:payment_method]
    
    
        
    #お届け先
    if params[:order][:address_num] == "0"
      @addresses = Addresses.find(params[:order][:address_box])
      @order.delivery_zip = @addresses.zip
      @order.address = @addresses.address
      @order.name = @addresses.name
    elsif params[:order][:address_num] == "1"
      @order.zip = params[:order][:delivery_zip]
      @order.address = params[:order][:delivery_address]
      @order.name = params[:order][:delivery_name]
    end
  end

  def create
    #@order = Order.new(order_params)
    #@order.status = 0
    #@order.member_id = current_member.id
    #@order.save
  #unless Member.where(id: order.member_id).where(zip: order.zip).where(address: order.address) || Addresses.where(member_id: order.member_id).where(name: order.name).where(zip: order.zip).where(address: order.address).exits?
    #addresses = Addresses.new
    #addresses.member_id = order.member_id
    #addresses.name = order.name
    #addresses.zip = order.zip
    #addresses.address = order.address
    #addresses.save
  #end
    #redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order)
    .permit(:member_id, :shipping_fee, :order_amount,:payment_method, :delivery_name, :delivery_address, :delivery_zip, :order_status)
  end
  
  #def order_params
    #params.require(:order)
    #.permit(:zip, :address, :lastname, :shipping_fee, :order_amount, :payment_method, :orders_status)
    #.merge(customer_id: current_customer.id)
  #end
end

















  #def new
    #@order = Order.new
    #@customer = Member.all
  #end
  
   #def confirm
    #@cart_items = CartItem.where(customer_id: @customer.id)
    # 全ての商品×個数の和に消費税を掛けた値(合計金額)
    #@total_price = (@cart_items.map { |cart_item| cart_item.item.price * cart_item.quantity }.sum * 1.08).floor
    # 現在の住所を使う場合
    #if params[:address] == 'now'
      #@order = Order.new(
        #customer_id: @customer.id,
        #postal_code: @customer.zip,
        #address: @customer.address,
        #name: @customer.lastname + @customer.firstname,
        #payment_way: params[:order][:payment_method]
      #)
    # 配送先登録した住所を使う場合
    #elsif params[:address] == 'select'
      #address =  Address.find_by(id: params[:select]) # params[:select]は選択した住所のid
      #@order = Order.new(
        #customer_id: @customer.id,
        #zip: address.zip,
        #address: address.address,
        #name: address.name,
        #payment_method: params[:order][:payment_method]
      #)
    # 新しく住所を追加する場合
    #elsif params[:address] == 'new'
      #@order = Order.new(order_params)
    #else
      #@order = Order.new(order_params)
    #end
    #if @order.invalid?(:confirm)
      #render :new
    #end
  #end

  #def create
    # カートが空の場合
    #if @customer.cart_items.blank?
      #redirect_to cart_items_path and return
    #end
    #@order = Order.new(order_params)
    #if @order.save
      # 注文商品テーブルのレコードを作成
      #@customer.cart_items.map do |cart_item|
        #OrderItem.create(
          #order_id: @order.id,
          #item_id: cart_item.item_id,
          #quantity: cart_item.quantity,
          #order_status: 'cannot',
          #price: (cart_item.item.price * 1.08).floor
        #)
      #end
      # カートアイテムを空にする
      #@customer.cart_items.destroy_all
      #redirect_to orders_thanks_path
    #else
      #render :new
    #end
  #end
  #def show
    #@order = Order.find(params[:id])
  #end

  #def index
    #@orders = @customer.orders.page(params[:page]).per(6).order(created_at: 'DESC')
  #end
  #private

  #def set_current_customer
    #@customer = current_customer
  #end
