class Item < ApplicationRecord
  # 画像取得・アップロード用
  attachment :image
  # enumの設定
  enum is_active: {販売中:0, 販売停止中:1}
end
