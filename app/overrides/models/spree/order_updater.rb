Spree::OrderUpdater.class_eval do 
    
    def update_order_total
      order.total = order.item_total + gift_wrap_total + order.shipment_total + order.adjustment_total
    end

    def gift_wrap_total
    	gift_total = 0.00
    	order.line_items.each {|i|
    		gift_total += i.gift_wraps.sum(:price)
    	}
    	gift_total.to_d
    end



end