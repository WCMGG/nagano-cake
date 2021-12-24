class Order < ApplicationRecord
  
  belongs_to :customer
  

  # enumの導入

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum select_address: { your_address: 0, registered_address: 1, new_address: 2, }


  # 消費税を加えた商品価格
    def add_tax_price
        (self.price * 1.1).round
    end
    
    def subtotal
      item.add_tax_price * amount
    end 
    
    

end
