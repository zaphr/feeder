class PlacesController < ApplicationController

  def search
    @places = Place.find_by_name params[:place_name]
    @title = session[:poi_type] 
  end

  def search_screen 
       
    if params[:latitude] && params[:longitude]
      session[:latitude] = params[:latitude]
      session[:longitude] = params[:longitude]   
    end  
 
    @latitude = session[:latitude]
    @longitude = session[:longitude]
        
    session[:poi_type] = params[:poi_type]
    @title = params[:poi_type]
    @poi_type = session[:poi_type]       
    if session[:place]
      p = session[:place] 
      if p.is_a?(Place) && !p.lpid.blank? && !p.short_name.blank?
          @previous_place = p  
      end   
    end
      
  end     

end
