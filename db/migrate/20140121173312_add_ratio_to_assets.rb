class AddRatioToAssets < ActiveRecord::Migration
  def change
    add_column :assetable_assets, :ratio, :float, precision: 5, scale: 4
  end
end
