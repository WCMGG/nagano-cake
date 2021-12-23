class Address < ApplicationRecord

  belongs_to :customer

  # orders#new画面で既に登録してある配送先を表示する際に使用
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + recelver_name
  end
end
