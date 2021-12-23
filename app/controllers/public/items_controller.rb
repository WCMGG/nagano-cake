class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @quantity = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
