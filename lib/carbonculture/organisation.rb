module Carbonculture
  class Organisation
    include HTTParty
    attr_accessor :name, :data, :body

    def initialize(name)
      self.name = name
      self.data = self.class.get "#{ BASE_URL }/#{ name }"

      raise ArgumentError if data.response.code == '404'
      self.body = JSON.parse(self.data.body)
    end

    def places
      body['places'].map { |p| Place.new(p, name) }
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