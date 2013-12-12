module Assetable
  module Config

    VALID_OPTION_KEYS = [
      :storage,
      :external_document_types
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