class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :galleryable, :polymorphic => true
      t.string :name
      t.timestamps
    end

    add_index :galleries, [:galleryable_type, :galleryable_id]
    add_index :galleries, [:galleryable_type, :galleryable_id, :name], unique: true, name: "named_gallery"

    add_index :galleries, :galleryable_id
  end
end
