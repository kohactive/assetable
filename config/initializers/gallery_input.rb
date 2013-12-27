class ActionView::Helpers::FormBuilder

  include ActionView::Helpers::Tags
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::NumberHelper

  def gallery method, options = {}
    # Build the association
    @object.send("build_#{method}") unless @object.present? and @object.send(method).present?
    # ID of the input wrapper
    options[:id] = field_id(method, options[:index])
    # The fieldname for the association
    fieldname = @object_name + "[#{method}_attributes][asset_ids][]"
    
    # Add the asset preview or the empty preview div
    if gallery = @object.send(method)
      asset_preview = ""
      gallery.assets.each do |a|
        asset_preview += asset_html(a, fieldname)
      end
    else
      asset_preview = content_tag(:div, "", class: "uploader-preview")
    end

    # Uploader HTML with the asset previews and actions
    uploader_html = content_tag(:div, (asset_preview.html_safe), class: "uploader-data-wrapper")

    # Wrap the previews and uploader in a div
    uploader_wrapper = content_tag(:div, uploader_html, class: "gallery-uploader", id: options[:id], :'data-uploader-input-name' => fieldname)
    return uploader_wrapper
  end

end