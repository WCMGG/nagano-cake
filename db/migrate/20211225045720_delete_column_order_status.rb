class DeleteColumnOrderStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_status, :integer
  end
end
