module Carbonculture
  class Organisation
    include HTTParty
    attr_accessor :name, :data, :body

    # Public: create an instance of an Organisation
    #
    # name - String of Organisation name
    #
    # Returns an Organisation
    def initialize(name)
      self.name = name
      self.data = self.class.get "#{ BASE_URL }/#{ name }"

      raise ArgumentError if data.response.code == '404'
      self.body = JSON.parse(self.data.body)
    end

    # Public: lists associated Places to the Organisation
    # 
    # Returns an Array of Places
    def places
      body['places'].map { |p| Place.new(p, name) }
    end

    
    # Public: Finds if a requested method is available in the API response
    #
    # Returns a String value or NoMethodError Exception
    def method_missing(method_name, *args, &block)
      if body.has_key?(method_name.to_s)
        body[method_name.to_s]
      else
        super
      end
    end
  end
end
