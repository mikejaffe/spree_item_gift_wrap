Spree::OrderPopulator.class_eval do 
	 
    def populate(variant_id, quantity,gift_wrap = nil)
      attempt_cart_add(variant_id, quantity,gift_wrap)
      valid?
    end

    private

    def attempt_cart_add(variant_id, quantity,gift_wrap = nil)
      quantity = quantity.to_i
      if quantity > 2_147_483_647
        errors.add(:base, Spree.t(:please_enter_reasonable_quantity, :scope => :order_populator))
        return false
      end

      variant = Spree::Variant.find(variant_id)
      if quantity > 0
        line_item = @order.contents.add(variant, quantity, currency)
        unless line_item.valid?
          errors.add(:base, line_item.errors.messages.values.join(" "))
          return false
        else
        	
        		Spree::GiftWrap.add_gift_wrap(gift_wrap,line_item) unless gift_wrap.nil?  
        end
      end
    end
  
end