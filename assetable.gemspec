$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "assetable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "assetable"
  s.version     = Assetable::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Assetable."
  s.description = "TODO: Description of Assetable."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.1"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "sqlite3"

  # s.add_development_dependency "bootstrap_sass_rails"
  # s.add_development_dependency "simple_form"

  s.add_runtime_dependency 'carrierwave'
  s.add_runtime_dependency 'carrierwave-video-thumbnailer'
  s.add_runtime_dependency 'fog'
  s.add_runtime_dependency 'rmagick'
  s.add_runtime_dependency 'plupload-rails'
  s.add_runtime_dependency 'kaminari'

  s.add_runtime_dependency 'haml-rails'
  s.add_runtime_dependency 'sass-rails'
  s.add_runtime_dependency 'coffee-rails'
  s.add_runtime_dependency 'jquery-rails'
end
