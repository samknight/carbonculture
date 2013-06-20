require_relative '../lib/carbonculture'

require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/carbonculture_cassettes'
  c.hook_into :webmock
end
