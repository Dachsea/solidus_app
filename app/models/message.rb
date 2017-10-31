class Message < ActiveRecord::Base
  belongs_to :message_card
  belongs_to :spree_orders
end
