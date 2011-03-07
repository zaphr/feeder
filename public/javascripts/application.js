(function() {
  var $;
  $ = jQuery;
  $(document).ready(function() {
    var hide_url_bar;
    hide_url_bar = function() {
      return window.scrollTo(0, 1);
    };
    $("body").delegate("#long_lat_search", "click", function(e) {
      var el;
      el = $(e.target);
      el.text('Attempting to get location');
      navigator.geolocation.getCurrentPosition(function(pos) {
        var actualHref, link, _i, _len, _ref;
        _ref = $('.find_me');
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          link = _ref[_i];
          actualHref = $(link).attr('href').split('?')[0];
          link.href = actualHref + '?latitude=' + pos.coords.latitude + '&longitude=' + pos.coords.longitude;
        }
        return el.text('Got location! Ready for search');
      });
      return false;
    });
    $("body").delegate("li a", "click", function(e) {
      return $(this).effect("highlight", {
        color: '#AAA'
      }, 200);
    });
    $("body").delegate(".search", "click", function(e) {
      var el, load_uri;
      el = $(e.target);
      $("#loading_screen").show();
      el.text('Loading...');
      load_uri = this.href + ' #reload_inner';
      $('#reload').load(load_uri, function() {
        $("#loading_screen").hide();
        $('#title').html($('#title_value').html());
        return hide_url_bar();
      });
      return false;
    });
    return hide_url_bar();
  });
}).call(this);
