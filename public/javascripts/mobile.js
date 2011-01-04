$(document).ready(function(){	

  $('#long_lat_search').click(function(e) {
    var $el = $(e.target);
	$el.text('Attempting to get location');	
	
	navigator.geolocation.getCurrentPosition(
	  function(pos){
        $('.find_me').each(function() {	
	      // Strip off existing url variables first		      
		  var actualHref = $(this).attr('href').split('?')[0];
		  this.href = actualHref + '?latitude='+pos.coords.latitude+'&longitude=' +pos.coords.longitude
		 });
		$el.text('Got location! Ready for search');
	  }
	);			
		return false;		
  });

  $('a').click(function() {		
    $(this).effect("highlight", {color: '#CCCCCC'}, 3000);	
  });	

  window.scrollTo(0, 1); 		
});