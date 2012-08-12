$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "change_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "change_logger"
  s.version     = ChangeLogger::VERSION
  s.authors     = ["Avi Tzurel"]
  s.email       = ["avi@kensodev.com"]
  s.homepage    = "http://www.avi.io"
  s.summary     = "Log your AR model changes into MongoDB"
  s.description = "Log your AR model changes into MongoDB"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "mongoid", "~> 2.4"
  s.add_dependency "bson_ext", "~> 1.5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "fabrication"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "faker"
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'mongoid-rspec'
  s.add_development_dependency 'fakeweb'
  s.add_development_dependency 'vcr'
end
