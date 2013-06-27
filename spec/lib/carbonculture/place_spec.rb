require_relative '../../spec_helper'

describe Carbonculture::Place do

  before do
    VCR.insert_cassette 'place', :record => :new_episodes  
  end

  after do
    VCR.eject_cassette
  end

  describe 'initialize class' do

    it 'must contain accept valid Place' do
      place = Carbonculture::Place.new('10-downing-street', 'number10')
      place.data.response.code.must_equal '200'
    end

    it 'must raise an error with an invalid Place' do
      proc { Carbonculture::Place.new('somewhere', 'unknown') }.must_raise ArgumentError
    end

    it 'parses the API response from JSON to a hash' do
      place = Carbonculture::Place.new('10-downing-street', 'number10')
      place.data.must_be_instance_of Hash
    end

  end

  describe 'dynamic attributes' do

    it 'returns the attribute value if present in the profile' do
      place = Carbonculture::Place.new('10-downing-street', 'number10')
      place.title.must_equal '10 Downing Street'
    end

    it 'raises a NoMethodError if an attribute is not present' do
      place = Carbonculture::Place.new('10-downing-street', 'number10')
      lambda { place.wrong }.must_raise NoMethodError
    end

  end

  describe 'Organisation association' do

    it 'returns an Organisation' do
      place = Carbonculture::Place.new('10-downing-street', 'number10')
      place.organisation.must_be_kind_of Carbonculture::Organisation
    end

    it 'returns an Array of Places' do
      place = Carbonculture::Place.new('10-downing-street', 'number10')
      place.organisation.name.must_equal 'number10'
    end

  end
end