class Place

  extend ResponseHelper

  attr_accessor :lpid, :full_name, :short_name

  def self.find_by_name(name)
    # CGI escape to url encode pl
    places = response.place_name_search CGI.escape(name)
    places.sort{|a,b|a.short_name.downcase <=> b.short_name.downcase}
  end
  
  def full_name_less_last
    names = @full_name.split(' -> ')
    names.pop
    names.join(' -> ')
  end  

  def url_safe_name
    # TODO: breaks on ()
    CGI.escape @short_name
  end

end

  
