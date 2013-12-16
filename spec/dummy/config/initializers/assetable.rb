Assetable.configure do |config|
  config.storage = :file
  config.external_document_types = ["iFrame", "Vimeo", "Vzaar"]
  config.external_document_icons = {
    :"Vimeo" => "icon-vimeo.png",
    :"Vzaar" => "icon-vzaar.png",
  }
end