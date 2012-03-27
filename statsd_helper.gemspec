# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "statsd_helper/version"

Gem::Specification.new do |s|
  s.name        = "statsd_helper"
  s.version     = StatsdHelper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Boucher"]
  s.email       = ["ryan.boucher@distributedlife.com"]
  s.homepage    = "http://github.com/distributedlife/statsd_helper"
  s.summary     = %q{Some helpers for consitent use across of statsd gems}
  s.description = %q{Some helpers for consitent use across of statsd gems. Nothing is automatic but consistency is slightly easier}

  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
