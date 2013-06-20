module Carbonculture
  require 'json'
  require 'httparty'
  Dir[File.dirname(__FILE__) + '/carbonculture/*.rb'].each do |file|
    require file
  end
end
