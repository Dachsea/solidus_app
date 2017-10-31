class RemoveMessageIdFromSpreeOrder < ActiveRecord::Migration
  def change
    remove_column :spree_orders, :message_id, :integer
  end
end
