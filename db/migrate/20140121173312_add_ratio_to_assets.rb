class AddRatioToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :ratio, :float, precision: 5, scale: 4
  end
end
