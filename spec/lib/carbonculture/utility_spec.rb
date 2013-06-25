require_relative '../../spec_helper'

describe Carbonculture::Utility do

  before do
    VCR.insert_cassette 'utility', :record => :new_episodes  
  end

  after do
    VCR.eject_cassette
  end

  describe 'initialize class' do

    it 'must contain accept valid Utility' do
      org = Carbonculture::Utility.new('10-downing-street', 'number10', 'elec')
      org.data.response.code.must_equal '200'
    end

    it 'must raise an error with an invalid Utility' do
      proc { Carbonculture::Utility.new('10-downing-street', 'number10', 'fake') }.must_raise ArgumentError
    end

    it 'parses the API response from JSON to a hash' do
      org = Carbonculture::Utility.new('10-downing-street', 'number10', 'elec')
      org.data.must_be_instance_of Hash
    end

  end

  describe 'dynamic attributes' do

    it 'returns the attribute value if present in the profile' do
      org = Carbonculture::Utility.new('10-downing-street', 'number10', 'elec')
      org.status.must_equal 'ok'
    end

    it 'raises a NoMethodError if an attribute is not present' do
      org = Carbonculture::Utility.new('10-downing-street', 'number10', 'elec')
      lambda { org.wrong }.must_raise NoMethodError
    end

  end
end