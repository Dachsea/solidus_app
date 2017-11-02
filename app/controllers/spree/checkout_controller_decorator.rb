Spree::CheckoutController.class_eval do
  include ApplicationHelper

  def update
    if @order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
      @order.temporary_address = !params[:save_user_address]
      success = if @order.state == 'confirm'
        @order.complete
      else
        @order.next
      end
      if !success
        flash[:error] = @order.errors.full_messages.join("\n")
        redirect_to checkout_state_path(@order.state) and return
      end

      if @order.completed?
        @current_order = nil
        flash.notice = Spree.t(:order_processed_successfully)
        flash['order_completed'] = true
        message_to_slack("#{@order.number}: 注文が来ましたよー")
        redirect_to completion_route
      else
        redirect_to checkout_state_path(@order.state)
      end
    else
      render :edit
    end
  end
end