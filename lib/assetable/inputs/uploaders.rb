module Assetable::Uploaders

  # Gallery preview is a set of assets. Let's loop over the assets in the
  # gallery and create a preview for each.
  def gallery_preview fieldname
    if modal_gallery = object.send("#{attribute_name}")
      gallery = ""

      modal_gallery.assets.each do |asset|
        gallery += asset_preview(asset, fieldname) 
      end

      gallery
    end
  end

  def asset_preview asset, fieldname=nil
    ActionController::Base.new.send(:render_to_string, partial: 'assetable/assets/asset', locals: { asset: asset, fieldname: fieldname })
  end

  def directions_html
    ActionController::Base.new.send(:render_to_string, :partial => 'assetable/assets/directions')
  end

end