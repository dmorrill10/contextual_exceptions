# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contextual_exceptions/version'

Gem::Specification.new do |spec|
  spec.name          = "contextual_exceptions"
  spec.version       = ContextualExceptions::VERSION
  spec.authors       = ["Dustin Morrill"]
  spec.email         = ["dmorrill10@gmail.com"]
  spec.description   = %q{ Provides an easy way to create and raise custom exceptions with the contextual information of previously raised system exceptions in Ruby >= 2.0.0 }
  spec.summary       = %q{ Provides an easy way to create and raise custom exceptions with the contextual information of previously raised system exceptions in Ruby >= 2.0.0 }
  spec.homepage      = "https://github.com/dmorrill10/contextual_exceptions"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'turn', '~> 0.9'
  spec.add_development_dependency 'minitest', '~> 4.7'
  spec.add_development_dependency 'awesome_print', '~> 1.0'
  spec.add_development_dependency 'pry-rescue', '~> 1.0'
  spec.add_development_dependency 'simplecov', '~> 0.7'
end
