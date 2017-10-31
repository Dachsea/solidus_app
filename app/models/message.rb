class Message < ActiveRecord::Base
  belongs_to :message_card
  has_many :spree_orders
end
