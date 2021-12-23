class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
# 税込表示の為の追加分
  def add_tax_price
    (self.price * 1.1).round
  end

end
