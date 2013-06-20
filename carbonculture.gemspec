# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carbonculture/version'

Gem::Specification.new do |spec|
  spec.name          = "carbonculture"
  spec.version       = Carbonculture::VERSION
  spec.authors       = ["Sam Knight"]
  spec.email         = ["sam@samknight.co.uk"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = "Ruby library to gather energy data from CarbonCulture"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
