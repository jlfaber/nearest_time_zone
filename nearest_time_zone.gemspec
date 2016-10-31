# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nearest_time_zone/version'

Gem::Specification.new do |spec|
  spec.name          = "nearest_time_zone"
  spec.version       = NearestTimeZone::VERSION
  spec.authors       = ["Sean Devine"]
  spec.email         = ["barelyknown@icloud.com"]
  spec.description   = %q{Quickly find the name of a time zone for a latitude and longitude without relying on a web service.}
  spec.summary       = %q{Quickly find the name of a time zone for a latitude and longitude without relying on a web service.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "kdtree"
end
