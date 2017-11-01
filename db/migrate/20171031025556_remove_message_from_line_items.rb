class RemoveMessageFromLineItems < ActiveRecord::Migration
  def change
    remove_column :spree_line_items, :message_id, :integer
    remove_column :spree_line_items, :message_card_id, :integer
  end
end
