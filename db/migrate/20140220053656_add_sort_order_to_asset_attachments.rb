class AddSortOrderToAssetAttachments < ActiveRecord::Migration
  def change
    add_column :asset_attachments, :sort_order, :integer, default: 0

    AssetAttachment.reset_column_information

    Gallery.all.each do |gallery|
      if gallery.asset_attachments.present?
        gallery.asset_attachments.each_with_index do |attachment, index|
          attachment.update_attribute(:sort_order, index)
        end
      end
    end
  end
end
