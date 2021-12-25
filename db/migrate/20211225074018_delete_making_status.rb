class DeleteMakingStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :making_status, :integer
  end
end
