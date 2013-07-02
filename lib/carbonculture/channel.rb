module Carbonculture
  class Channel
    include HTTParty
    attr_accessor :name, :place_name, :organisation_name, :data, :body, :results

    def initialize(name, place_name, organisation_name, options = {})
      self.name = name
      self.place_name = place_name
      self.organisation_name = organisation_name
      self.results = []

      call_api(options)

      begin
        self.body = JSON.parse(self.data.body)
      rescue
        raise ArgumentError
      end

      build_results

    end

    def place
      Place.new(place_name, organisation_name)
    end

    def method_missing(method_name, *args, &block)
      if body.has_key?(method_name.to_s)
        body[method_name.to_s]
      else
        super
      end
    end

    private

    def call_api(options = {})
      option_params = []
      options.each_pair { |k, v| option_params << "#{ k }=#{ v }" }

      self.data = self.class.get "#{ BASE_URL }/#{ organisation_name }/#{ place_name }/#{ name }" + '?' + option_params.join('&')
    end

    def build_results
      set_start = Time.parse(body['start_time'])
      set_end = Time.parse(body['end_time'])
      set_ratio = (set_end - set_start) / body['points'].to_i
      body['results'].each do |result|
        self.results << Result.new(set_start, set_start + set_ratio, result.first)
        set_start = set_start + set_ratio
      end
    end

  end
end
