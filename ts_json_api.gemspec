$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ts_json_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ts_json_api"
  s.version     = TsJsonApi::VERSION
  s.authors     = ["Matt Brewer"]
  s.email       = ["mbrewer@nascar.com"]
  s.homepage    = "http://www.nascar.com"
  s.summary     = "Use this gem to consume the T&S JSON API provided for live & summary race data."
  s.description = "This is intended for internal purposes only"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*.rb"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "rest-client"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
