# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "palco/version"

Gem::Specification.new do |s|
  s.name        = "palco"
  s.version     = Palco::VERSION
  s.authors     = ["Paolo Perego"]
  s.email       = ["thesp0nge@gmail.com"]
  s.homepage    = "http://armoredcode.com"
  s.summary     = %q{Creates Sinatra application and extension directory layout}
  s.description = %q{Creates Sinatra application and extension directory layout}

  s.rubyforge_project = "palco"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rainbow"
end
