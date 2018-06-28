$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "activity/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "activity-log"
  s.version = Activity::VERSION
  s.authors = ["James Kropp"]
  s.email = ["james-kropp@hotmail.com"]
  s.homepage = "https://github.com/jameskropp/activity-log"
  s.summary = "Rails Activity Logger"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5"
  s.add_dependency "kaminari"

  s.add_development_dependency "mysql2"
end
