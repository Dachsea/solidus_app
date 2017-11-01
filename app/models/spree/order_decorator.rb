Spree::Order.class_eval do
  has_one :message, dependent: :destroy

  accepts_nested_attributes_for :message
end