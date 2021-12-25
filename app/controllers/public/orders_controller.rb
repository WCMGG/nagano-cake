class Public::OrdersController < ApplicationController
  def new
    @new_order = Order.new
  end

  def index
    @orders = current_customer.order
  end

  def show
  end

  def confirm

    @order = Order.new(order_params)
    @order.billing_amount =


    # 注文情報入力画面から確認画面へ渡す注文先データの取得

    if params[:order][:payment_method] == "0"
      @order.payment_method = "0"
    elsif params[:order][:payment_method] == "1"
      @order.payment_method = "1"
    end

    # 注文情報入力画面から確認画面へ渡す配送先データの取得

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.receiver_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address=Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.receiver_name = @address.recelver_name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.receiver_name = params[:order][:reciever_name]
    end


  end

  def create
    @order = Order.new(order_params)
    @orders = Order.all
    @order.customer_id = current_customer.id

    if @order.save

      redirect_to complete_path

    else
      render :show
    end

  end

  def complete
  end



  private


  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :receiver_name, :shipping_cost, :billing_amount, :order_status)
  end

end
