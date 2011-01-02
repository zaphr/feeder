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

      
end
