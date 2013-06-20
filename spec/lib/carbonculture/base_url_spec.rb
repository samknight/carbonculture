require_relative '../../spec_helper'

describe Carbonculture do
  it 'has a base url' do
    Carbonculture::BASE_URL.must_equal 'http://data.carbonculture.net'
  end
end
