module Carbonculture
  class Place
    include HTTParty
    attr_accessor :name, :organisation_name, :data, :body

    # Public: Create a new instance of a Channel
    #
    # name - String of Place name
    # org_name - String of Organisation name
    #
    # Returns a Place
    def initialize(name, org_name)
      self.name = name
      self.organisation_name = org_name
      self.data = self.class.get "#{ BASE_URL }/#{ org_name }/#{ name }"

      self.body = JSON.parse(self.data.body)
      raise ArgumentError if status == 'fail'

    end

    # Public: Associate with parent Organisation 
    #
    # Returns an Organisation
    def organisation
      Organisation.new(organisation_name)
    end

    # Public: Forms an association with related Channels
    #
    # options - Hash of available options in the API
    #
    # Returns an Array of Channels
    def channels(options = {})
      body['channels'].map { |c| Channel.new(c, name, organisation_name, options) }
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
