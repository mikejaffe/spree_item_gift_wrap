class Spree::GiftWrap < ActiveRecord::Base
	belongs_to :line_item

	validates :gift_text, :presence => true

	def self.add_gift_wrap(gift_wrap,line_item)

		wraps = Spree::GiftWrap.where(:line_item => line_item).count
		if wraps < line_item.quantity 
			Spree::GiftWrap.create(:gift_text => gift_wrap, :line_item => line_item,:price => Spree::GiftWrap.price.value.to_f)
			ou = Spree::OrderUpdater.new(line_item.order)
			ou.update_order_total
			ou.order.save
		end
	end

	def remove
		self.destroy
		ou = Spree::OrderUpdater.new(line_item.order)
		ou.update_order_total
		ou.order.save
	end

	def self.price
		price = Spree::Preference.where(:key => "spree_gift_wrap_price").first
		price.present? ? price : 0.00
	end

	def self.total(order)
		gift_total = 0
		order.line_items.each do |i|
			gift_total += Spree::GiftWrap.where(:line_item_id => i.id).sum("price")
		end
		gift_total
	end

end
