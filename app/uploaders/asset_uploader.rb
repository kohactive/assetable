# encoding: utf-8

class AssetUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  storage Assetable.storage

  # Set the MD5 hash
  process :set_md5

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    if model.present?
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{mounted_as}"
    end
  end
    
  # Set an MD5 hash of the image
  def set_md5
    if model.present?
      model.checksum = Digest::MD5.file(current_path).to_s
    end 
  end

end
