# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boxy-cap/version'

Gem::Specification.new do |spec|
  spec.name          = "boxy-cap"
  spec.version       = BoxyCap::Recipes::VERSION
  spec.authors       = ["Vipul A M", "Michael Nikitochkin" ]
  spec.email         = ["vipul@bigbinary.com"]
  spec.description   = %q{A litle knife to deploy Rails application}
  spec.summary       = %q{Capistrano 3 recipes for nginx, monit, rails log, setup, unicorn}
  spec.homepage      = "https://github.com/bigbinary/boxy-cap"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'capistrano', '>= 3.4.0'
end
