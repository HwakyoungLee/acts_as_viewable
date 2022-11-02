# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'acts_as_viewable/version'

Gem::Specification.new do |s|
  s.name        = 'acts_as_viewable'
  s.version     = ActsAsViewable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Hwakyoung Lee']
  s.email       = ['young@grepp.co']
  s.summary     = %q{Rails gem to allowing records to be viewable}
  s.description = %q{Rails gem to allowing records to be viewable}

  s.add_dependency 'rails', '>= 5.0.0'
  s.add_development_dependency 'sqlite3'

  s.files       = `git ls-files`.split("n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.require_path = 'lib'
end
