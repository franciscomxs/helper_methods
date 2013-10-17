# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'helper_methods/version'

Gem::Specification.new do |s|

  s.name        = "helper_methods"
  s.version     = HelperMethods::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.summary     = "Helper methods that helps you to DRY"
  s.email       = ["franciscomxs@gmail.com"]
  s.homepage    = "https://github.com/franciscomxs/helper_methods"
  s.description = "A small collection of simple methods"
  s.authors     = ["Francisco Martins"]
  
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

end