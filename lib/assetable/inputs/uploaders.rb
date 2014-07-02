module Assetable::Uploaders

  # Gallery preview is a set of assets. Let's loop over the assets in the
  # gallery and create a preview for each.
  def gallery_preview fieldname
    if modal_gallery = object.send("#{attribute_name}")
      gallery = ""

      # modal_gallery.assets.each do |asset|
      modal_gallery.asset_attachments.each_with_index do |asset_attachment, index|
        # gallery += asset_preview(asset, :gallery, fieldname) 
        gallery += ac.new.send(:render_to_string, partial: "assetable/shared/templates/gallery_item", locals: { asset: asset_attachment.asset, asset_attachment: asset_attachment, fieldname: fieldname, index: index })
      end

      gallery
    end
  end

  def asset_preview asset, type=:asset, fieldname=nil
    ac.send(:render_to_string, partial: "assetable/shared/templates/#{type.downcase.to_s}_item", locals: { asset: asset, fieldname: fieldname })
  end

  def directions_html
    ac.send(:render_to_string, :partial => 'assetable/assets/directions', locals: {directions: directions})
  end

  def ac
    return @c if @c.present?
    @c = ActionController::Base.new
    @c.request = OpenStruct.new()
    @c
  end

end