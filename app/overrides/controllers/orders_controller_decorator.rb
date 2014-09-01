Spree::OrdersController.class_eval do 
    def populate
      populator = Spree::OrderPopulator.new(current_order(create_order_if_necessary: true), current_currency)
      gift_text = params[:gift_wrap].present? ? params[:gift_text] : nil
      if populator.populate(params[:variant_id], params[:quantity], gift_text)
        current_order.ensure_updated_shipments
        respond_with(@order) do |format|
          format.html { redirect_to cart_path }
        end
      else
        flash[:error] = populator.errors.full_messages.join(" ")
        redirect_to :back
      end
    end


end