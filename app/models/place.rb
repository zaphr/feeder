class Place

  extend ResponseHelper

  attr_accessor :lpid, :full_name, :short_name

  def self.find_by_name(name)
    # CGI escape to url encode pl
    response.place_name_search CGI.escape(name)
  end

  def url_safe_name
    # TODO: breaks on ()
    CGI.escape @short_name
  end

end

  
