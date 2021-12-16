class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :ordered_price, null: false
      t.integer :item_amount, null: false
      # enum
      t.integer :making_status, null: false
      
      t.timestamps
    end
  end
end
