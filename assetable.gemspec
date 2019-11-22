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

  s.add_dependency "rails", "~> 4.1.16"

  s.add_development_dependency "thor", "~> 0.18"
  s.add_development_dependency "rspec-rails", "~> 2.14"
  s.add_development_dependency "shoulda-matchers", "~> 2.5"
  s.add_development_dependency "factory_girl_rails", "~> 4.3"
  s.add_development_dependency "capybara", "~> 2.2"
  s.add_development_dependency "guard-rspec", "~> 4.2"
  s.add_development_dependency "guard-spork", "~> 1.5"
  s.add_development_dependency "sqlite3", "~> 1.3.13"

  s.add_dependency 'carrierwave', '0.10.0'
  s.add_dependency 'fog', '>= 1.8.0'
  s.add_dependency 'kaminari', '~> 0.15.1'
  s.add_dependency 'rmagick', '~> 2.13.2'
  s.add_dependency 'plupload-rails', '~> 1.2.1'
  s.add_dependency 'simple_form', '~> 3.2.0'

  s.add_dependency 'coffee-rails', "~> 4.2"
  s.add_dependency 'haml-rails', "~> 0.9"
  s.add_dependency 'jquery-rails', "~> 3.1"
  s.add_dependency 'sass-rails', "~> 5.0"
end
