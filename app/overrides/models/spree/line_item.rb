Spree::LineItem.class_eval do 
	has_many :gift_wraps 
 	after_save :recalc_giftwraps  

 	def recalc_giftwraps
 		if self.quantity < self.gift_wraps.count
 			self.gift_wraps.last.destroy
 		end
 	end

 
end