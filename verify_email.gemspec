$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "verify_email/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "verify_email"
  s.version     = VerifyEmail::VERSION
  s.authors     = ["Mike Mell"]
  s.email       = ["mike.mell@nthwave.net"]
  s.homepage    = "TODO"
  s.summary     = "A small gem to facilitate confirming a user controls their claimed email address."
  s.description = "TODO: Description of VerifyEmail."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.2"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "factory_girl_rails"
end
