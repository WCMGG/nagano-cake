class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum select_method: { your_address: 0, registered_address: 1, new_address: 2, }
end
