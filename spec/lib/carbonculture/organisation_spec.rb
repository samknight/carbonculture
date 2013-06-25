require_relative '../../spec_helper'

describe Carbonculture::Organisation do

  before do
    VCR.insert_cassette 'organisation', :record => :new_episodes  
  end

  after do
    VCR.eject_cassette
  end

  describe 'initialize class' do

    it 'must contain accept valid Organisation' do
      org = Carbonculture::Organisation.new('number10')
      org.data.response.code.must_equal '200'
    end

    it 'must raise an error with an invalid Organisation' do
      proc { Carbonculture::Organisation.new('unknown') }.must_raise ArgumentError
    end

    it 'parses the API response from JSON to a hash' do
      org = Carbonculture::Organisation.new('number10')
      org.data.must_be_instance_of Hash
    end

  end

  describe 'dynamic attributes' do

    it 'returns the attribute value if present in the profile' do
      org = Carbonculture::Organisation.new('number10')
      org.title.must_equal 'Number 10'
    end

    it 'raises a NoMethodError if an attribute is not present' do
      org = Carbonculture::Organisation.new('number10')
      lambda { org.wrong }.must_raise NoMethodError
    end

  end
end