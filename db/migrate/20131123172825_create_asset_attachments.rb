class CreateAssetAttachments < ActiveRecord::Migration
  def change
    create_table :asset_attachments do |t|
      t.references :asset
      t.references :assetable, :polymorphic => true
      t.string :name
      t.timestamps
    end

    add_index :asset_attachments, :asset_id
    add_index :asset_attachments, [:assetable_type, :assetable_id]
    add_index :asset_attachments, [:assetable_type, :assetable_id, :name], unique: true, name: "named_asset"
    add_index :asset_attachments, :assetable_id
  end
end
