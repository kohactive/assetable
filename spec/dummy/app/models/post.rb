class Post < ActiveRecord::Base

  assetable :image, :hero_image
  galleryable :hadouken

  has_many :sections
  accepts_nested_attributes_for :sections

end
