class Poi < BasicPoi

  extend ResponseHelper

  attr_accessor :full_address, :opening_hours, :phone_number, :url, :review, :lp_mobile_url

  def self.find(lpid)
    response.poi_single_search(lpid)
  end

end

