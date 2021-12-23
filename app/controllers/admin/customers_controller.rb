class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.page(params[:page])
  end
    
    
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :zip_code, :address, :tel, :email, :admittion_status)
  end
end