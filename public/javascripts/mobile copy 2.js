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

// $('a').livequery('click', function(event) { 
//         alert('clicked'); 
//         return false; 
//     });


$("body").delegate(".search", "click", function(){
	  var load_uri = this.href + ' #reload_inner';
	  $('#reload').load(load_uri);
	return false;
});



// $("body").delegate(".search", "click", function(){
//   $(this).after("<p>Another paragraph!</p>");
// });


// $('.search').livequery('click', function() {
// 	alert('foo'); 
// 	  var load_uri = this.href + ' #reload_inner';
// 	  $('#reload').load(load_uri);
//         return false; 
//     });


// $('.search').click(function() {
// 	  var load_uri = this.href + ' #reload_inner';
// 	  $('#reload').load(load_uri);
// 	  $.get('/pages/reload', function(data) {
// 	    $('#script_reload').html(data);	
// 	});	
// return false;	
// });



window.scrollTo(0, 1);

// window.history.forward();
// function noBack() { window.history.forward(); }
		
});

function showLoadingImage() {
	alert('loading');
    $('#loading').show();
}

function hideLoadingImage() {
    $('#loading').hide();
}

$('.search').click(function() {
	  var load_uri = this.href + ' #reload_inner'
	  $('#reload').load(load_uri);	
});
