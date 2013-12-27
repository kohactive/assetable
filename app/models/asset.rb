# Base Asset Class
# ---------------------------------------
# Available Attributes:
# :type
# :name
# :body
# :filename
# :checksum
# :path
# :content_type
# :file_size
# :width
# :height
# :duration
# :bit_rate

class Asset < ActiveRecord::Base

  has_many :asset_attachments, :as => :assetable, :dependent => :destroy
  has_many :assetable, :through => :asset_attachments
  
  before_save :update_asset_attributes



  # File Type Helpers
  # ---------------------------------------------------------------------

  # Is the asset a image?
  def image?
    self.type == "Image"
  end

  # Is the asset a document?
  def document?
    self.type == "Document"
  end

  # Is the asset a video?
  def video?
    self.type == "Video"
  end

  def external_service?
    self.type == "ExternalService"
  end


  # File meta and helpers
  # ---------------------------------------------------------------------

  # Get the file type extension from the filename
  def extension
    filename = File.extname(self.filename.to_s)
    filename[0] = '' # remove the dot, i.e. (.docx or .pptx)
    filename
  end

  # Add some custom attributes to the asset
  def update_asset_attributes
    if !self.external_service? and self.present? and self.changed?
      self.content_type = self.filename.file.content_type
      self.file_size = self.filename.file.size
      self.width, self.height = `identify -format "%wx%h" #{self.filename.file.path}`.split(/x/) unless self.document?
      # self.checksum = Digest::MD5.file(self.filename.to_s).to_s
    end
  end

end
