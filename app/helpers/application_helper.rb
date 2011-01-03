module ApplicationHelper

def google_search_term
 "#{@poi.url_safe_name}+#{@place.url_safe_name}"
end  

def tripadvisor_search_term
  #TODO Breaks on "Bev & Micks". & encoded but tripadvisor loses it on redirect
  google_search_term
end

def lp_search_term
  google_search_term
end

def place_view_line(place)
  "#{place.short_name}  -  #{place.full_name_less_last}" 
end  

def construct_bounding_box(latitude, longitude, meters)
  dec_lat = latitude.to_d
  dec_long = longitude.to_d
  mod = 0.00001 * meters
  "#{(dec_lat + mod).to_s},#{(dec_lat - mod).to_s},#{(dec_long + mod).to_s},#{(dec_long - mod).to_s}"  
end

def human_meters(meters)
  "#{meters} m"
end

end
