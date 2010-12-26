class PlacesController < ApplicationController

  def search
    # CGI escape to url encode place name
    @places = Place.search CGI.escape(params[:place_name])
    @title = session[:poi_type]    
  end

  def search_screen
    session[:poi_type] = params[:poi_type]
    @title = params[:poi_type]
  end  

end
