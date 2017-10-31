class RemoveMessage < ActiveRecord::Migration
  def change
    drop_table :messages
    drop_table :message_cards
  end
end
