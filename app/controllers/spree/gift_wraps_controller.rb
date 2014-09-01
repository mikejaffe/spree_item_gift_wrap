class Spree::GiftWrapsController < Spree::StoreController

	def create
		line_item = Spree::LineItem.find(params[:line_item_id])
		Spree::GiftWrap.add_gift_wrap(params[:gift_text],line_item)
		respond_to do |format|
			format.js {
				
			}
		end
	end

	def destroy
		gift = Spree::GiftWrap.find(params[:id])
		gift.remove
		redirect_to cart_path
	end
end
