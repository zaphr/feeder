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

  def self.search(name)
    response.place_name_search(name)
  end

  private

  # def self.response
  #   @response ||= GatewayResponse.new
  # end

end

  
