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

//   $('.search').click(function() {
// 	alert('a');
// 	$.get(this.href, function(data) {
// 	  $('.reload').html(data);	
// 	});			
// return false;	
// });

alert('re');
$('.search').click(function() {
	  alert('a');
	  var load_uri = this.href + ' #reload_inner'
	  $('#reload').load(load_uri);	
	  alert('b');
	
	  // $('#script_reload').html(<%= render 'pages/reload_script' %>);
	
	// $.get(this.href, function(data) {
	//   $('.reload').html(data);	
	// });
	
	// $.ajax({
	//    type: "GET",
	//    url: this.href,
	//    dataType: "script"
	//  });


	// $('.search').click(function() {
	// 	  var load_uri = this.href + ' #reload_inner'
	// 	  $('#reload').load(load_uri);	
	// });
// 
// 
				
return false;	
});
window.scrollTo(0, 1);

window.history.forward();
function noBack() { window.history.forward(); }
		
});

function showLoadingImage() {
    $('#loading').show();
}

function hideLoadingImage() {
    $('#loading').hide();
}

$('.search').click(function() {
	  var load_uri = this.href + ' #reload_inner'
	  $('#reload').load(load_uri);	
});




// $('#script_reload').html("");
// $('#script_reload').html("<script>$('.search').click(function() {var load_uri = this.href + ' #reload_inner';$('#reload').load(load_uri);return false;}); </script>");
//  alert('bar');	 
// $('#script_reload').html("
// <script>
// alert('foo');  
// $('.search').click(function() {
// 	  var load_uri = this.href + ' #reload_inner';
// 	  $('#reload').load(load_uri);	
// return false;	
// }); 
// </script>
// ");