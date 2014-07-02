module Assetabler
  class ExternalService < Asset

    validates_presence_of :name, :body

    def self.possible_content_types
      if user_defined_document_types = Assetable.external_document_types
        return user_defined_document_types
      else
        return ["iFrame", "Third Party API"]
      end
    end

    def has_icon?
      available_icons = Assetable.external_document_icons.collect{|k, v| k}
      available_icons.include? self.content_type.to_sym if self.content_type.present?
    end

    def icon
      Assetable.external_document_icons[self.content_type.to_sym].to_s if self.has_icon?
    end

  end
end