  class Admin::OrdersController < ApplicationController
   def index
    @orders = Order.all
    @orders_page = Customer.page(params[:page]).per(10)
   end

   def show
     @order = Order.find(params[:id])
     @customer = @order.customer
     @order_details = @order.order_details.all
   end

   def subtotal
    item.with_tax_price * amount
   end


   def update
    # order = Order.find(params[:id])
    # status = params[:order][:status].to_i
    # order.update(status: status)
    # redirect_to admin_order_path(order)

    # @order = Order.find(params[:id])
    # @order_details = @order.ordered_details
    # if @order.update(order_params)
    # status_change_to_1 = @order.status_was == 0 and @order.status == 1
    # @order.order_details.update(status: 1) if status_change_to_1

    # redirect_to request.referer
    # else
    # redirect_to request.referer
    # Order

    # def update
    # @cart_item = CartItem.find(params[:id])
    # @cart_item.update(cart_item_params)
    #   redirect_to cart_items_path
    # end


    # @order = Order.find(params[:id])
    # @order_detail = OrderDetail.find(params[:id])
    # @order_details = @order.order_details

    # @order_detail.update(order_detail_params)
    #   redirect_to admin_order_path(order)


    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "対応ステータスを更新しました"
    else
      render :show, alert: "対応ステータスを更新できませんでした"
    end


   end




   private

   def order_params
    params.require(:order).permit(:order_status)
   end

  end