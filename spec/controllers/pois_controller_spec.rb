require 'spec_helper'

describe PoisController do
  render_views
  
  before(:each) do
    @place = Factory.build(:place)
  end
  
  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :lpid => '1098362'
      response.should be_success
    end  
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index', :place_lpid => '362494'
      response.should be_success
    end  
  end  
    
  
end