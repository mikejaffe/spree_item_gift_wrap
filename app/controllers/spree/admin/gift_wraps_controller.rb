class Spree::Admin::GiftWrapsController < Spree::Admin::BaseController

	def index
		@giftwrap = Spree::Preference.where(:key => "spree_gift_wrap_price").first
		if @giftwrap.blank?
			@giftwrap = Spree::Preference.new
			@giftwrap.key = "spree_gift_wrap_price"
			@giftwrap.value = 0.00 
			@giftwrap.save
		end
	end

	def update
		@giftwrap = Spree::Preference.where(:key => "spree_gift_wrap_price").first
		@giftwrap.value = params[:gift_wrap_price]
		@giftwrap.save
		flash[:success] = flash_message_for(@giftwrap, :successfully_updated)
		render :index
	end
end
