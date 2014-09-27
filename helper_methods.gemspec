# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'helper_methods/version'

Gem::Specification.new do |spec|

  spec.name        = 'helper_methods'
  spec.version     = HelperMethods::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.summary     = 'Helper methods that helps you to DRY'
  spec.email       = 'franciscomxs@gmail.com'
  spec.homepage    = 'https://github.com/franciscomxs/helper_methods'
  spec.description = 'A small collection of simple methods'
  spec.authors     = ['Francisco Martins']
  spec.licenses    = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'pry'
  spec.add_dependency 'rails', '~> 4'

end
