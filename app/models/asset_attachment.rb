class AssetAttachment < ActiveRecord::Base

  belongs_to :asset
  belongs_to :assetable, polymorphic: true

  before_validation :ensure_name_is_not_blank
  before_save :set_sort_order

  # Is the asset_attachment attached to a gallery?
  def gallery?
    assetable_type.downcase == "gallery"
  end

  def gallery
    assetable
  end


  private

    # Ensure the name is not blank to avoid unique indexes on the name
    # If it's blank, let's set it to nil
    def ensure_name_is_not_blank
      name = nil if name.blank?
    end

    def set_sort_order
      sort_order = assetable.asset_attachments.size if gallery? and sort_order.blank?
    end

end