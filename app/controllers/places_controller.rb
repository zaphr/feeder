class PlacesController < ApplicationController

  def search
    @places = Place.find_by_name params[:place_name]
    @title = session[:poi_type]    
  end

  def search_screen
    session[:poi_type] = params[:poi_type]
    @title = params[:poi_type]
    
    #AHHHH the horror O_o
    if session[:place]
      p = session[:place] 
      if p.is_a?(Place) 
        if !p.lpid.blank? && !p.short_name.blank?
          @previous_place = p  
        end 
      end   
    end  

  end  

end
