module Assetable::AssetHelper

  def asset_preview asset
    render partial: "assetable/shared/asset_preview", locals: { asset: asset }
  end

end