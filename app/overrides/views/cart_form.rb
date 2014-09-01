Deface::Override.new(:virtual_path  => "spree/products/_cart_form",
					 
                     :insert_after => "div.add-to-cart",
                     :partial          => "spree/shared/gift_wrap_cart_form",
                     :name => "add_gift_wrap_item_cart_form"
                      )


Deface::Override.new(:virtual_path  => "spree/orders/_line_item",
					 
                     :insert_bottom => "tr",
                     :partial          => "spree/shared/gift_wrap_cart_line_items",
                     :name => "add_gift_wrap_line_item"
                      )

Deface::Override.new(:virtual_path  => "spree/orders/_line_item",
					 
                     :insert_bottom => "td.cart-item-description",
                     :partial          => "spree/shared/add_gift_wrap_links",
                     :name => "add_gift_wrap_links"
                      )
 	