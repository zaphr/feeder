$(document).ready(function(){	

  $("body").delegate("#long_lat_search", "click", function(e){
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

	$("body").delegate("li a", "click", function(){
      $(this).effect("highlight", {color: '#AAA'}, 200);
	});
	
	$("body").delegate(".search", "click", function(){
		$("#loading").show();
		  var load_uri = this.href + ' #reload_inner';
		  $('#reload').load(load_uri, function(){
		  $("#loading").hide();
		  $('#title').html($('#title_value').html());
          window.scrollTo(0, 1);		
		});
		return false;
	});

window.scrollTo(0, 1);		
});

