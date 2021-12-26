class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

 enum making_status: {"製作不可":0, "製作待ち":1, "製作中":2, "製作終了":3 }
 
  # 消費税を加えた商品価格
    def add_tax_price
        (self.ordered_price * 1.1).round
    end
    
    def subtotal
      add_tax_price * item_amount
    end

 def add_tax_price
    (self.ordered_price * 1.1).round
 end

end
