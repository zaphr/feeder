class PoisController < ApplicationController

  def index
    session[:poi_type] = params[:poi_type] if params[:poi_type]
    @pois  = Poi.find_by_place_and_type(params[:place_lpid], session[:poi_type])
    @place_id = params[:place_lpid]
    @title = session[:poi_type]
  end 

  def show
    @poi = Poi.find(params[:lpid])
    @title = session[:poi_type]    
  end

end