  class Admin::OrdersController < ApplicationController
   def index
    @orders = Order.all
    @order = Order.find(params[:id])
    @orders_page = Customer.page(params[:page]).per(10)
   end
   
   def show
     @customer = Customer.find(params[:id])
     @order = Order.find(params[:id])
     @item = item.find(params[:id])
     @cart_item = Cart_item.find(params[:id])
     @ordered_details = @order.ordered_details
   end
   
   def subtotal
    item.with_tax_price * amount
   end
   
   def update
    order = Order.find(params[:id])
    status = params[:order][:status].to_i
    order.update(status: status)
    redirect_to admin_order_path(order)
   end  
    
  end