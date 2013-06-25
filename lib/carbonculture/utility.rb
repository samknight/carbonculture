module Carbonculture
  class Utility
    include HTTParty
    attr_accessor :name, :data, :body

    def initialize(name, org_name, util_name)
      self.data = self.class.get "#{ BASE_URL }/#{ org_name }/#{ name }/#{ util_name }"

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