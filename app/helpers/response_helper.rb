module ResponseHelper

  def response
    @response ||= GatewayResponse.new
  end

  class GatewayResponse

    def initialize
      consumer_key = "xxxxx"
      consumer_secret = "xxxxx"
      @environment_url = "http://apigateway.lonelyplanet.com"
      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, :site => @environment_url)
      @token = OAuth::AccessToken.new(consumer)
    end

    def place_name_search(name)
      parse_places @token.get("/api/places?name=#{name}").body
    end

    def parse_places(response)
      Hash.from_xml(response)['places'].map {|place_hash| create_place place_hash}
    end
    
    def create_place(attribute_hash)
      attribute_hash.to_options!
      place = Place.new
      [:full_name, :short_name].each {|name| place.send("#{name}=", attribute_hash[name])}
      place.lpid = attribute_hash[:id] 
      place  
    end  

    def poi_bounding_box_search(bounding_box, poi_type)
      url = "/api/bounding_boxes/#{bounding_box}/pois"
      unless poi_type == 'all'
        url += "?poi_type=#{poi_type.capitalize}" 
      end
      # Danger of key being too long..
      response = Rails.cache.fetch(url) {@token.get(url).body}      
      parse_pois response.dup   
    end  

    def poi_search(place_lpid, poi_type='all')
      url = "/api/places/#{place_lpid}/pois"
      unless poi_type == 'all'
        url += "?poi_type=#{poi_type.capitalize}" 
      end
      response = Rails.cache.fetch(url) {@token.get(url).body}
      parse_pois response.dup
    end

    def parse_pois(response)
      Hash.from_xml(response)['pois'].map {|poi_hash| create_basic_poi poi_hash }
    end

    def create_basic_poi(attribute_hash)
      attribute_hash.to_options!
      basic_poi = BasicPoi.new
      [:name, :latitude, :longitude].each {|name| basic_poi.send("#{name}=", attribute_hash[name])}
      basic_poi.lpid = attribute_hash[:id]
      basic_poi.type = attribute_hash[:poi_type]
      basic_poi      
    end  

    def poi_single_search(lpid)
      url = "/api/pois/#{lpid}"
      response = @token.get(url).body    
      create_poi Hash.from_xml(response)['poi']
    end

    def create_poi(attribute_hash)
      attribute_hash.to_options!
      poi = Poi.new
      [:name, :latitude, :longitude, :review].each {|name| poi.send("#{name}=", attribute_hash[name])}
      poi.type = attribute_hash[:poi_type]
      poi.opening_hours = attribute_hash[:hours]
      poi.full_address = determine_full_address attribute_hash[:address]
      poi.phone_number = determine_phone_number attribute_hash[:telephones]
      poi.url = determine_url attribute_hash[:urls]
      poi.lp_mobile_url = determine_lp_mobile_url attribute_hash[:representations]
      poi      
    end
    
    def determine_lp_mobile_url(representations_array)      
      begin 
        url = representations_array.second['href']       
        return url if url =~ /m.lonelyplanet.com\/et-\d{2,}$/i
        return nil   
      rescue
        return nil
      end    
    end  
  
    def determine_full_address(address)
      if address.is_a?(Hash) && address['street'] && address['locality']
        "#{address['street']}, #{address['locality']}"
      else
        nil
      end    
    end
 
    def determine_phone_number(number_array)
      number = number_array.first
      return nil if number.nil? || number.empty? 
      "#{number['number']}" 
    end    

    def determine_url(url_array)
      url = url_array.first
      return nil if url.nil? || url.empty?
      "#{url}" 
    end  
    
  end
end