$ = jQuery

$(document).ready ->

  hide_url_bar = -> 
    window.scrollTo(0, 1)

  $("body").delegate "#long_lat_search", "click", (e) ->
    el = $(e.target)
    el.text 'Attempting to get location'

    navigator.geolocation.getCurrentPosition (pos) ->
      for link in $('.find_me')
        actualHref = $(link).attr('href').split('?')[0]
        link.href = actualHref + '?latitude='+pos.coords.latitude+'&longitude=' +pos.coords.longitude
      el.text 'Got location! Ready for search'
    return false
  
  $("body").delegate "li a", "click", (e) ->
    $(this).effect("highlight", {color: '#AAA'}, 200)

  $("body").delegate ".search", "click", (e) ->
    el = $(e.target)
    $("#loading_screen").show()
    el.text 'Loading...'
    load_uri = this.href + ' #reload_inner'
    $('#reload').load load_uri, ->
      $("#loading_screen").hide()
      $('#title').html($('#title_value').html())
      hide_url_bar()
    return false

  hide_url_bar()