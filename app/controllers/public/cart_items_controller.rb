class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
      redirect_to cart_items_path
      
    # if current_customer.cart_items.find_by(item_id: [])
    # end
    
    # if Item.find_by(name: "ショートケーキ")
    # puts "商品が存在する"
    # else
    # puts "商品が存在しない"
    # end
    
    
  end

  # 小計として追加したメソッド
  def subtotal
    item.with_tax_price * amount
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
      redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
