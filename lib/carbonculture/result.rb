module Carbonculture
  class Result
    include HTTParty
    attr_accessor :start_time, :end_time, :value

    def initialize(start_time, end_time, value)
      self.start_time = start_time
      self.end_time = end_time
      self.value = value
    end
  end
end
