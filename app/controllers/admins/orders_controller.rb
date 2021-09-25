class Admins::OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
    @member_address = current_member.addresses
  end
  
  def confirm
        #@cart_items = current_customer.cart_products
        #@order = Order.new(order_params)
        #@order.shipping_fee = 300
        #@order.payment_method = params[:order][:payment_method]
        
        #お届け先
        #if params[:order][:address_num] == "0"
            #@order.delivery_zip = current_member.zip
            #@order.delivery_address = current_member.address
            #@order.delivery_name = current_member.lastname + current_member.firstname
        #elsif params[:order][:address_num] == "1"
            #@shipping_address = ShippingAddress.find(params[:order][:address_box])
            #@order.postcode = @shipping_address.postcode
            #@order.address = @shipping_address.address
            #@order.name = @shipping_address.name
            
        #elsif params[:order][:address_num] == "2"
            #@order.postcode = params[:order][:postcode]
           # @order.address = params[:order][:address]
            #@order.name = params[:order][:name]
        #end
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
    params.require(:order).permit(:member_id, :shipping_fee, :order_amount,:payment_method, :delivery_name, :delivery_address, :delivery_zip, :order_status)
  end
end
