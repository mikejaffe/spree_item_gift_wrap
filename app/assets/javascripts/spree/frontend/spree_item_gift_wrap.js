// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

 $(document).on('click','#gift_wrap_add',function(event){
 	$(this).parent().find(".gift-wrap-textarea").toggle(0,function(){
 		$(this).parent().find(".gift-wrap-textarea").val("");
 	});
 });



 $(document).on('click','.add-gift-note',function(event){
 	event.preventDefault();
 	 gift_text  = $(this).prev();
 	 if (gift_text.val().length < 1) { 
 	 	gift_text.css({"border-color":"red"});
 	 	return;
 	 };
 	 $.ajax({
 	 	url: $(this).data("url"),
 	 	type: 'POST',
 	 	data: {"line_item_id" : $(this).data("line-item-id"),"gift_text": gift_text.val()},
 	 });
 	 

 });
 
