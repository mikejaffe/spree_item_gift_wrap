Spree::Order.class_eval do 
	def display_item_total
	  ou = Spree::OrderUpdater.new(self)
      Spree::Money.new(item_total + ou.gift_wrap_total   , { currency: currency })
    end
end