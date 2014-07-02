class AddSortOrderToAssetAttachments < ActiveRecord::Migration
  def change
    add_column :assetable_asset_attachments, :sort_order, :integer, default: 0

    Assetabler::AssetAttachment.reset_column_information
    Assetabler::Gallery.reset_column_information

    Assetabler::Gallery.all.each do |gallery|
      if gallery.asset_attachments.present?
        gallery.asset_attachments.each_with_index do |attachment, index|
          attachment.update_attribute(:sort_order, index)
        end
      end
    end
  end
end
