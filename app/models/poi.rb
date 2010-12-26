class Poi

  extend ResponseHelper

  def initialize(poi_hash)
    @hash = poi_hash
  end

  def name
    @hash['name']
  end

  def url_safe_name
    CGI.escape @hash['name']
  end  

  def full_address
    address = @hash['address']
    if address['street'] && address['locality']
      "#{address['street']}, #{address['locality']}"
    else
      nil
    end    
  end
  
  def opening_hours
    @hash['hours']  
  end  
  
  def phone_number
    number = @hash['telephones'].first
    return nil if number.nil? || number.empty? 
    "#{number['number']}" 
  end    
  
  def url
    url = @hash['urls'].first
    return nil if url.nil? || url.empty?
    "#{url}" 
  end  
  
  def review
    @hash['review']  
  end
  
  def latitude
    @hash['latitude']  
  end
 
  def longitude
    @hash['longitude']  
  end 
  
  def is_mapable?
    # basic sanity check
    @hash['longitude'] && @hash['latitude']  
  end  

  def lpid
    @hash['id']
  end

  def dump
    @hash
  end

  def self.find_by_place_and_type(place_lpid, poi_type='all')
    response.poi_search(place_lpid, poi_type)
  end

  def self.find(lpid)
    response.poi_single_search(lpid)
  end

end

