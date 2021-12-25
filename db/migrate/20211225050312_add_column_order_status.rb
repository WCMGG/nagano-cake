class AddColumnOrderStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_status, :integer, null: false, default: 0
  end
end
