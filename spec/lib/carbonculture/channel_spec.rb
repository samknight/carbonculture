require_relative '../../spec_helper'

describe Carbonculture::Channel do

  before do
    VCR.insert_cassette 'channel', :record => :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  describe 'initialize class' do

    it 'must contain accept valid Channel' do
      channel = Carbonculture::Channel.new('elec', '10-downing-street', 'number10')
      channel.data.response.code.must_equal '200'
    end

    it 'must raise an error with an invalid Channel' do
      proc { Carbonculture::Channel.new('fake', '10-downing-street', 'number10') }.must_raise ArgumentError
    end

    it 'parses the API response from JSON to a hash' do
      channel = Carbonculture::Channel.new('elec', '10-downing-street', 'number10')
      channel.data.must_be_instance_of Hash
    end

  end

  describe 'dynamic attributes' do

    it 'returns the attribute value if present in the profile' do
      channel = Carbonculture::Channel.new('elec', '10-downing-street', 'number10')
      channel.status.must_equal 'ok'
    end

    it 'raises a NoMethodError if an attribute is not present' do
      channel = Carbonculture::Channel.new('elec', '10-downing-street', 'number10')
      lambda { channel.wrong }.must_raise NoMethodError
    end

  end
end