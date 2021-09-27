class Members::OrdersController < ApplicationController

  def index
    @orders = current_member.orders.all
    # page(params[:page]).per(6).order(created_at: 'DESC')
  end

  def new
    @order = Order.new
    @order.member_id = current_member.id
    @addresses = current_member.addresses
  #  ↑メールアドレスを表記させるのに必要なので
  end

  def confirm
    @cart_items = current_member.cart_items
    @order = Order.new(order_params)
    @order.shipping_fee = 300
    @order.payment_method = params[:order][:payment_method]
    @sum = 0
    @order_amount = 300



    #お届け先
    if params[:order][:address_num] == "0"#登録済みから選択
      @address = Address.find(params[:order][:address_id])
      @order.delivery_zip = @address.zip
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    elsif params[:order][:address_num] == "1"#お届け先新規登録
      @order.delivery_zip = params[:order][:delivery_zip]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]
    end
  end

  def create
    @cart_items = current_member.cart_items
    @addresses = current_member.addresses
    @order = Order.new(order_params)
    @order.order_status = 0
    @order.member_id = current_member.id
    @order.save

    #商品情報の保存
    cart_items = current_member.cart_items
    cart_items.each do |item|
      ordered_item = OrderedItem.new
      ordered_item.order_id = @order.id
      ordered_item.item_id = item.item.id
      ordered_item.piece = item.piece
      #ordered_item.price_taxin = item.price
      ordered_item.making_status = 0
      ordered_item.save
    end
    current_member.cart_items.destroy_all

    #配送先情報の保存
  unless Member.where(id: @order.member_id).where(zip: @order.delivery_zip).where(address: @order.delivery_address) || Address.where(member_id: @order.member_id).where(name: @order.delivery_name).where(zip: @order.delivery_zip).where(address: order.delivery_address).exits?
    @address = Address.new
    @address.member_id = order.member_id
    @address.name = order.delivery_name
    @address.zip = order.delivery_zip
    @address.address = order.delivery_address
    @address.save
  end
    @cart_items.destroy_all
    redirect_to members_orders_complete_path
  end

  def complete
  end

  private

  def order_params
    params.require(:order)
    .permit(:member_id, :shipping_fee, :order_amount, :payment_method, :delivery_name, :delivery_address, :delivery_zip, :order_status)
    .merge(member_id: current_member.id)
  end
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
