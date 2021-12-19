class Public::CustomersController < ApplicationController
  def show
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def unsubscribe
  end
  
  def update
    
  end
  
  def withdraw
  end
  
end
