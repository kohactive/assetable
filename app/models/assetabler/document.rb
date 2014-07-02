module Assetabler
  class Document < Asset

    mount_uploader :filename, DocumentUploader

  end
end