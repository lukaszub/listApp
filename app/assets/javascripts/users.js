$(document).on("turbolinks:load", function(){
	
		$('#all').click(function(event){
			event.preventDefault();
			$('.list-all').fadeIn("slow");
		});

		$('#work').click(function(event){
			event.preventDefault();
			$('.list-all').fadeOut(500);
			$('.list-home').fadeOut(500);
			$('.list-work').fadeIn("slow");
		});

		$('#home').click(function(event){
			event.preventDefault();
			$('.list-all').fadeOut(500);
			$('.list-work').fadeOut(500);
			$('.list-home').fadeIn("slow")
		});
});