# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'helper_methods/version'

Gem::Specification.new do |gem|
  gem.name          = "helper_methods"
  gem.version       = HelperMethods::VERSION
  gem.authors       = ["Francisco Martins"]
  gem.email         = ["franciscomxs@gmail.com"]
  gem.description   = "A small collection of simple methods"
  gem.summary       = "Helper methods that helps you to DRY"
  gem.homepage      = "https://github.com/franciscomxs/helper_methods"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

end