module Carbonculture
  class Result
    include HTTParty
    attr_accessor :start_time, :end_time, :value

    # Public: creates an instance of a Result
    #
    # start_time - start time of the particular value
    # end_time - end time of the particular value
    # value - average value across the time period
    # 
    # Returns a Result
    def initialize(start_time, end_time, value)
      self.start_time = start_time
      self.end_time = end_time
      self.value = value
    end
  end
end
