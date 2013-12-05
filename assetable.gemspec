$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "assetable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "assetable"
  s.version     = Assetable::VERSION
  s.authors     = ["John Koht"]
  s.email       = ["john@kohactive.com"]
  s.homepage    = "http://www.github.com/kohactive/assetable"
  s.summary     = "Dead simple asset uploader attachments for your active record models"
  s.description = "Dead simple asset uploader attachments for your active record models"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "sqlite3"

  s.add_runtime_dependency 'carrierwave'
  s.add_runtime_dependency 'fog'
  s.add_runtime_dependency 'rmagick'
  s.add_runtime_dependency 'plupload-rails'
  s.add_runtime_dependency 'kaminari'

  s.add_runtime_dependency 'haml-rails'
  s.add_runtime_dependency 'sass-rails'
  s.add_runtime_dependency 'coffee-rails'
  s.add_runtime_dependency 'jquery-rails'
end
