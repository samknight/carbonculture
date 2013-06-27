module Carbonculture
  class Channel
    include HTTParty
    attr_accessor :name, :place_name, :organisation_name, :data, :body

    def initialize(name, place_name, organisation_name)
      self.name = name
      self.place_name = place_name
      self.organisation_name = organisation_name
      self.data = self.class.get "#{ BASE_URL }/#{ organisation_name }/#{ place_name }/#{ name }"
      puts "#{ BASE_URL }/#{ organisation_name }/#{ place_name }/#{ name }"

      begin
        self.body = JSON.parse(self.data.body)
      rescue
        raise ArgumentError
      end

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