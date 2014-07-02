class CreateAssetAttachments < ActiveRecord::Migration
  def change
    create_table :assetable_asset_attachments do |t|
      t.references :asset
      t.references :assetable, :polymorphic => true
      t.string :name
      t.timestamps
    end

    add_index :assetable_asset_attachments, :asset_id
    add_index :assetable_asset_attachments, [:assetable_type, :assetable_id], name: "poly_asset"
    add_index :assetable_asset_attachments, [:assetable_type, :assetable_id, :name], unique: true, name: "named_asset"
    add_index :assetable_asset_attachments, :assetable_id
  end
end
