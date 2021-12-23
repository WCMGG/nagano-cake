class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items
  has_many :orders, through: :order_details
  has_many :order_details
  
  # 画像取得・アップロード用
  attachment :image
  
  # 消費税計算用
  def add_tax_price
    (self.price * 1.10).round
  end
  
end
