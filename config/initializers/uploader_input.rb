class ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::NumberHelper

  # = cf.uploader :attachment, select_file: true, text: "or drag and drop your PO"

  def uploader method, options = {}
    # add an ID to the options
    options[:id] = field_id(method, options[:index]) unless options[:id].present?

    # Set the fieldname
    fieldname = @object_name + "[#{method}_association_attributes][asset_id]"

    # Create the uploader
    value = @object.nil? ? nil : @object.send(method)

    # Add the asset preview or the empty preview div
    if asset = asset_record(method)
      asset_preview = asset_html(asset, fieldname)
    else
      asset_preview = content_tag(:div, "", class: "uploader-preview")
    end
    
    # uploaer html with preview and input
    uploader_html = content_tag(:div, (asset_preview), class: "uploader-data-wrapper")

    # Create and return the uploader html
    uploader_wrapper = content_tag(:div, uploader_html, class: "uploader #{'uploader-has-asset' if asset} #{options[:class]}", id: "uploader_#{options[:id]}", :'data-uploader-input-name' => fieldname, :'data-uploader-directions' => get_directions(options), :'data-max-file-size' => get_max_file_size(options))
    return uploader_wrapper
  end


  # Convenience method to create the asset html
  def asset_html asset, fieldname
    image_tag = asset_preview_image(asset)
    asset_name = content_tag(:span, asset.name.to_s, class: "uploader-name")
    asset_size = content_tag(:span, number_to_human_size(asset.file_size.to_s), class: "uploader-size")
    asset_size_and_actions = content_tag(:div, (asset_size + asset_actions(asset, fieldname)), class: "uploader-size-and-actions")
    field = hidden_field_tag(fieldname, (asset.id))
    return content_tag(:div, (image_tag + asset_name + asset_size_and_actions + field), class: "uploader-preview", :'data-asset-id' => asset.id)
  end

  # Asset preview image or fallback to a content type image
  def asset_preview_image asset
    if asset.image?
      preview_image_tag = image_tag(asset.filename.preview.to_s, class: "uploader-preview")
    elsif asset.document?
      preview_image_tag = image_tag(ActionController::Base.helpers.asset_path("assetable/icons/icon-#{asset.extension}.png"), class: "uploader-preview")
    elsif asset.video?
      preview_image_tag = image_tag(ActionController::Base.helpers.asset_path("assetable/icons/icon-mp4.png"), class: "uploader-preview")
    elsif asset.external_service?
      if asset.has_icon?
        preview_image_tag = image_tag(ActionController::Base.helpers.asset_path("assetable/icons/#{asset.icon}"), class: "uploader-preview")
      else
        preview_image_tag = image_tag(ActionController::Base.helpers.asset_path("assetable/icons/icon-document.png"), class: "uploader-preview")
      end
    end

    return link_to preview_image_tag, asset.filename.to_s, target: "_blank"
  end

  # Asset actions, i.e.e remove and edit buttons
  def asset_actions asset, fieldname
    remove_btn = link_to "delete", "#", class: "btn-uploader btn-uploader-remove-asset"
    edit_btn = link_to "edit", Rails.application.routes.url_helpers.edit_assetable_asset_path(asset, fieldname: fieldname), class: "btn-uploader btn-uploader-edit-asset", :'data-asset-id' => asset.id, remote: true
    content_tag(:div, (remove_btn + edit_btn), class: "uploader-actions")
  end

  # Get the asset record, if it's a belongs_to assocation, then we
  # can grab the actual record
  def asset_record method
    @object.send(method) rescue nil
  end

  # Get the field id
  def field_id label, index=nil
    output = index ? "_#{index}" : ''
    return @object_name + output + "_#{label}"
  end

  def get_max_file_size options
    (options[:max_file_size] || Assetable.max_file_size || "10MB").to_s
  end

  def get_directions options
    directions = options[:directions] || ''
  end

end