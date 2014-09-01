Deface::Override.new(:virtual_path  => "spree/admin/shared/_configuration_menu",
					 
                     :insert_bottom => "nav.menu ul",
                     :text          => "<li><a href='/admin/gift_wraps'>GIFT WRAPING</a></li></li>",
                     :name => "gift_wrap_config"
                      )