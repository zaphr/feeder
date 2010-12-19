class Place

  attr_reader :name, :lpid, :full_name

  def self.search(name)
    response.place_search(name)
  end

  def self.show(lpid)
    response.placeid_search(lpid)
  end

  def initialize(name)
    @name = name
  end

  private

  def self.response
    @response ||= GatewayResponse.new
  end


  class GatewayResponse

    def initialize
      consumer_key = "8blqFYW0uGYJMnAzB1MQ"
      consumer_secret = "Y15vzkdCjyyWe01Cvi2BJKHcKLLdJPqQN9xXQb8"
      @environment_url = "http://apigateway.lonelyplanet.com"
      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, :site => @environment_url)
      @token = OAuth::AccessToken.new(consumer)
    end

    def place_search(name)
      parse_places @token.get("/api/places?name=#{name}").body
    end

    def placeid_search(lpid)
      @token.get("/api/places/#{lpid}").body
    end

    def parse_places(response)
      places = []
      doc = Nokogiri::XML(response) { |config| config.strict.noblanks }
      doc.xpath('//text()[not(normalize-space())]').remove
      doc.root.children.each do |child|
        places << Place.new(child.at("full-name").text)
      end
      places
    end

  end
  
end