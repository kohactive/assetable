module Assetabler
  class Image < Asset

    mount_uploader :filename, ImageUploader

  end
end