Spree::Order.class_eval do
  has_one :message, dependent: :destroy

  accepts_nested_attributes_for :message, reject_if: :reject_message

  private
    def reject_message(attributes)
      attributes["message_card_id"].blank?
    end
end