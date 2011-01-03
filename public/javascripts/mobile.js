$(document).ready(function(){	

  $('#long_lat_search').click(function(e) {
    var $el = $(e.target);
	$el.text('Attempting to get location');	
	
	navigator.geolocation.getCurrentPosition(
	  function(pos){
        $('.find_me').each(function() {		
		  var actualHref = $(this).attr('href');
		  this.href = actualHref + '?latitude='+pos.coords.latitude+'&longitude=' +pos.coords.longitude
		 });
		$el.text('Got location! Ready for search');
	  }
	);			
		return false;		
  });

  $("a:[href^='/']").click(function(e) {
	var $el = $(e.target);
	$el.text('Loading..');	
  });	

  window.scrollTo(0, 1); 		
});