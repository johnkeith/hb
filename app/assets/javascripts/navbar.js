(function(){
	$(function(){
		console.log("document ready!")
		$('#render-as-partial').click(function(){
			console.log("clicked!");
			$.ajax({
				url: '/edit_profile.js',
				type: 'GET'
			});
		});
	});
})();