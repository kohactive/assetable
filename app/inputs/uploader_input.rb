class UploaderInput < SimpleForm::Inputs::FileInput

  include Assetable::Uploaders

  def input
    # Create the hidden input as fields_for
    # hidden_input = @builder.simple_fields_for "#{attribute_name}_association".to_sym, include_id: false do |a|
    #   a.input :asset_id, as: :hidden, input_html: {class: 'assetable-uploader-input'}
    # end

    # fieldname = template.hidden_field_tag("#{object_name}[#{attribute_name}_association_attributes][asset_id]", object.send(attribute_name).id, class: "assetable-uploader-input")
    

    fieldname = "#{object_name}[#{attribute_name}_association_attributes][asset_id]"
    puts "fieldname:: #{fieldname}"

    # For has_one uploaders, we'll add a nil valued hidden field so that we can
    # remove an image (similar to how checkboxes work)
    hidden_field = template.hidden_field_tag(fieldname, nil, class: "assetable-uploader-input")
    
    # Asset preview
    preview = asset_preview(object.send("#{attribute_name}"), fieldname)

    # Uploader HTML = preview + hidden input
    uploader_html = template.content_tag(:div, (hidden_field + preview.html_safe), class: "uploader-assets-wrapper")

    # Create and return the uploader html
    uploader_wrapper = template.content_tag :div, (uploader_html + directions_html.html_safe), class: "assetable-uploader"
    return uploader_wrapper
  end

end