require 'spec_helper'

describe PagesController do
  render_views 
  describe "GET 'find_me'" do
    it "should be successful" do
      get 'find_me'
      response.should be_success
    end  
  end  
  
end  
