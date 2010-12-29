class PoisController < ApplicationController

  def index
    session[:poi_type] = params[:poi_type] if params[:poi_type]
    @pois  = BasicPoi.find_by_place(params[:place_lpid], session[:poi_type])
    @place_id = params[:place_lpid]
    @title = session[:poi_type]
    
    if params[:place_lpid] && params[:place_name]
      p = Place.new
      p.lpid = params[:place_lpid]
      p.short_name = params[:place_name]
      session[:place] = p
    end
  end 

  def show
    @poi = Poi.find(params[:lpid])
    @title = session[:poi_type]
    @place = session[:place]    
  end

end