Spree::Order.class_eval do

  include ApplicationHelper

  has_one :message, dependent: :destroy

  accepts_nested_attributes_for :message, reject_if: :reject_message

  def finalize!
    # lock all adjustments (coupon promotions, etc.)
    all_adjustments.each{|a| a.close}

    # update payment and shipment(s) states, and save
    updater.update_payment_state
    shipments.each do |shipment|
      shipment.update!(self)
      shipment.finalize!
    end

    updater.update_shipment_state
    save!
    updater.run_hooks

    touch :completed_at

    #slackにメッセージを送信
    message_to_slack("#{self.number}: 注文が来ましたよー")

    deliver_order_confirmation_email unless confirmation_delivered?
  end

  private
    def reject_message(attributes)
      attributes["message_card_id"].blank?
    end
end