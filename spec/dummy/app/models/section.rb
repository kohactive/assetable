class Section < ActiveRecord::Base

  assetable :image, :hero_image
  galleryable :hadouken
  
  belongs_to :post

end
