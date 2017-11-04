Spree::OrdersController.class_eval do

  def update
    if @order.contents.update_cart(order_params)
      destroy_message_if_card_id_blank(order_params,@order)

      respond_with(@order) do |format|
        format.html do
          if params.has_key?(:checkout)
            @order.next if @order.cart?
            redirect_to checkout_state_path(@order.checkout_steps.first)
          else
            redirect_to cart_path
          end
        end
      end
    else
      respond_with(@order)
    end
  end

  private
    #メッセージカードを指定した後注文を途中でキャンセルし、「なし」を再度選択した場合には前回登録したメッセージが消える
    def destroy_message_if_card_id_blank(params, order)
      if params[:message_attributes][:message_card_id] == "" && !order.message.nil?
        order.message.destroy
      end
    end
end