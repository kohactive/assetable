# Default configs
Assetable.configure do |config|
  config.storage = :fog
  config.max_file_size = "10MB"
  config.unique_assets = true
end