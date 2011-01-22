class PagesController < ApplicationController

  def find_me
    @home_page = true
    @latitude = session[:latitude]
    @longitude = session[:longitude]
    @title = 'tiny trek'
    @title = ' '
  end  
  
end  