module Assetable::AssetHelper

  def asset_preview asset
    render_to_string partial: "assetable/shared/asset_preview", locals: { asset: asset }
  end

end