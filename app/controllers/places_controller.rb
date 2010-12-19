class PlacesController < ApplicationController
  def index

    @places = Place.search params[:place_name]

  end

  def search
    @places = Place.search params[:place_name]
  end

  def show
    @place = Place.show params[:lpid]
  end

end
