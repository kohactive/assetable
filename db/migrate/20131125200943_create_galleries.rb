class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :assetable_galleries do |t|
      t.references :galleryable, :polymorphic => true
      t.string :name
      t.timestamps
    end

    add_index :assetable_galleries, [:galleryable_type, :galleryable_id], name: "poly_asset_gallery"
    add_index :assetable_galleries, [:galleryable_type, :galleryable_id, :name], unique: true, name: "named_gallery"

    add_index :assetable_galleries, :galleryable_id
  end
end
