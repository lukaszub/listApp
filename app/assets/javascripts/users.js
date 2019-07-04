$(document).on("turbolinks:load", function(event){
		event.preventDefault();	
		$('.list-work').css("display","none");
		$('.list-home').css("display","none");
		$('.div-all').mouseover(function(){
			$(this).addClass("div-all-shadow-hover");
		});
		$('.div-all').mouseleave(function(){
			$(this).removeClass("div-all-shadow-hover");
		});
	
		$('#all').click(function(event){
			event.preventDefault();
			$('.list-work').fadeOut();
			$('.list-home').fadeOut();
			$('.list-all').fadeIn("2000");
			$('.title').text("All:")
		});

		$('#work').click(function(event){
			event.preventDefault();
			$('.list-all').fadeOut();
			$('.list-home').fadeOut();
			$('.list-work').fadeIn("2000");
			$('.title').text("Work:")
		});

		$('#home').click(function(event){
			event.preventDefault();
			$('.list-all').fadeOut();
			$('.list-work').fadeOut();
			$('.list-home').fadeIn("2000")
			$('.title').text("Home:")
		});
});