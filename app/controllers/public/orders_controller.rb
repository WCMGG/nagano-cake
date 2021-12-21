class Public::OrdersController < ApplicationController
  def new
    @new_order = Order.new
    @order = current_customer
  end

  def index
  end

  def show
  end

  def complete
    # if select_method = 0 
    #   @order.postal_code = current_customer.postal_code
    #   @order.address = current_customer.address
    #   @order.name = current_customer.name
    # else select_method = 1
    #   @address=address.find(palams[:address_id])
    #   @order.postal_code = @address.postal_code
    #   @order.address = @address.address
    #   @order.name = @address.name
    # else select_method = 2
      
    #   @order.postal_code = @.postal_code
    #   @order.address = @.address
    #   @order.name = @.name
    # end
  end

  def create
  end

  def confirm
  end
  
  
  
  private
  
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
end
