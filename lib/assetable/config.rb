module Assetable
  module Config

    VALID_OPTION_KEYS = [
      :storage,
      :max_file_size,
      :external_document_types,
      :external_document_icons
    ]
    
    attr_accessor *VALID_OPTION_KEYS
    
    def configure
      yield self
      self
    end
    
    def options
      options = {}
      VALID_OPTION_KEYS.each{ |pname| options[pname] = send(pname) }
      options
    end
        
  end
end