class BasicPoi

  extend ResponseHelper

  attr_accessor :lpid, :name, :type, :latitude, :longitude

  def self.find_by_place(place_lpid, poi_type='all')
    response.poi_search(place_lpid, poi_type)
  end

  def self.find_by_bounding_box(bounding_box, poi_type='all')
    response.poi_bounding_box_search(bounding_box, poi_type)    
  end  

  def url_safe_name
    # TODO: breaks on ()
    CGI.escape @name
  end  
  
  def is_mapable?
    # basic sanity check
    @latitude && @longitude
  end  

end

