class ActionView::Helpers::FormBuilder

  def uploader method, options = {} 
    # add an ID to the options
    options[:id] = field_id(method, options[:index]) unless options[:id].present?

    # Set the fieldname
    fieldname = @object_name + "[#{method}_association_attributes][asset_id]"

    if asset = asset_record(method)
      asset_preview = ActionController::Base.new.send(:render_to_string,
        :partial => 'assetable/assets/asset', locals: { asset: asset, fieldname: fieldname, options: options })
    else
      asset_preview = content_tag(:div, "", class: "uploader-preview")
    end

    # uploaer html with preview and input
    uploader_html = content_tag(:div, asset_preview.html_safe, class: "uploader-data-wrapper")

    # Create and return the uploader html
    uploader_wrapper = content_tag(:div, (uploader_html + directions_html("uploader_#{options[:id]}", fieldname).html_safe), class: "uploader #{'uploader-has-asset' if asset} #{options[:class]}", id: "uploader_#{options[:id]}", :'data-uploader-input-name' => fieldname, :'data-uploader-directions' => get_directions(options), :'data-max-file-size' => get_max_file_size(options))
    return uploader_wrapper
  end

end