class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assetable_assets do |t|
      t.string :type
      t.string :name
      t.text :body
      t.string :filename
      t.string :checksum
      t.string :path
      t.string :content_type
      t.integer :file_size
      t.integer :width
      t.integer :height
      t.integer :duration
      t.integer :bit_rate
      t.timestamps
    end
  end
end
