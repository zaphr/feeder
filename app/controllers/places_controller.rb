class PlacesController < ApplicationController

  def search
    @places = Place.find_by_name params[:place_name]
    @title = session[:poi_type]    
  end

  def search_screen
    session[:poi_type] = params[:poi_type]
    @title = params[:poi_type]
  end  

end
