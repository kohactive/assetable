class VideoUploader < CarrierWave::Uploader::Base

  storage :file
  
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    if model.present?
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{mounted_as}"
    end
  end
  
  # Create an MP4 version
  # version :mp4 do
  #   process :encode_video => [:mp4, resolution: "1280x720", custom: "-preset medium"]
  # end
  
  # version :ogv, :from_version => :mp4 do
  #   process :encode_ogv => [resolution: :same]
  # end
  
  # # Create a thumbnail
  # version :gallery_thumb do
  #   process thumbnail: [{format: 'jpg', quality: 10, size: "100x100", strip: true, logger: Rails.logger}]
  #   def full_filename for_file
  #     png_name for_file, version_name
  #   end
  # end
  
  def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.jpg}
  end

  def default_url
    ActionController::Base.helpers.asset_path("assetable/" + [version_name, "video.png"].compact.join('_'))
  end

end