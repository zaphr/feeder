class Place

  extend ResponseHelper

  attr_accessor :name, :lpid

  def initialize(place_hash)
    @hash = place_hash
  end

  def name
    @hash['full_name']
  end

  def lpid
    @hash['id']
  end

  def self.find_by_name(name)
    # CGI escape to url encode place name
    response.place_name_search CGI.escape(name)
  end

end

  
