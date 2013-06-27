module Carbonculture
  class Place
    include HTTParty
    attr_accessor :name, :organisation_name, :data, :body

    def initialize(name, org_name)
      self.name = name
      self.organisation_name = org_name
      self.data = self.class.get "#{ BASE_URL }/#{ org_name }/#{ name }"

      self.body = JSON.parse(self.data.body)
      raise ArgumentError if status == 'fail'

    end

    def organisation
      Organisation.new(organisation_name)
    end

    def channels
      body['channels'].map { |c| Channel.new(c, name, organisation_name) }
    end

    def method_missing(method_name, *args, &block)
      if body.has_key?(method_name.to_s)
        body[method_name.to_s]
      else
        super
      end
    end
  end
end