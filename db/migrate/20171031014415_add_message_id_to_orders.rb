class AddMessageIdToOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :message_id, :integer
  end
end
