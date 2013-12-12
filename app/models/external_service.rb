class ExternalService < Asset

  validates_presence_of :name, :body

  # G
  def self.possible_content_types
    if user_defined_document_types = Assetable.external_document_types
      return user_defined_document_types
    else
      return ["iFrame", "Third Party API"]
    end
  end

end
