class Gallery < ActiveRecord::Base

  belongs_to :galleryable, polymorphic: true
  has_many :asset_attachments, as: :assetable, dependent: :destroy
  has_many :assets, through: :asset_attachments

end
