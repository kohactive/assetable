module Assetable
  class Engine < ::Rails::Engine
    config.generators.integration_tool :rspec
    config.generators.test_framework :rspec


    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w( Moxie.swf Moxie.xap )
    end

    # Run the engine migrations with the main app rake task
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
