class ActionView::Helpers::FormBuilder

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
      gallery.assets.each do |asset|
        asset_preview += ActionController::Base.new.send(:render_to_string,
        :partial => 'assetable/assets/asset', locals: { asset: asset, fieldname: fieldname, options: options })
      end
    else
      asset_preview = content_tag(:div, "", class: "uploader-preview")
    end

    # Uploader HTML with the asset previews and actions
    uploader_html = content_tag(:div, (asset_preview.html_safe), class: "uploader-data-wrapper")

    # Wrap the previews and uploader in a div
    uploader_wrapper = content_tag(:div, (uploader_html + directions_html("uploader_#{options[:id]}", fieldname).html_safe), class: "gallery-uploader #{options[:class]}", id: "uploader_#{options[:id]}", :'data-uploader-input-name' => fieldname, :'data-uploader-directions' => get_directions(options), :'data-max-file-size' => get_max_file_size(options))
    return uploader_wrapper
  end

end