module Assetabler
  class Gallery < ActiveRecord::Base

    belongs_to :galleryable, polymorphic: true
    has_many :asset_attachments, -> { order('sort_order asc') }, as: :assetable, dependent: :destroy
    has_many :assets, through: :asset_attachments

    accepts_nested_attributes_for :asset_attachments, allow_destroy: true



  end
end
