class GalleryInput < SimpleForm::Inputs::FileInput

  include Assetable::Uploaders

  def input
    # TODO:: Find a better way to do this
    fieldname = "#{object_name}[#{attribute_name}_attributes][asset_ids][]"

    # This is the hidden input that identifies which gallery we are saving
    # otherwise it will create a new gallery each time.
    hidden_input = template.hidden_field_tag("#{object_name}[#{attribute_name}_attributes][id]", object.send(attribute_name).id)

    # This is the hidden inputs for the uploader. Each asset added to the
    # gallery will use this input name
    gallery_hidden_input = template.hidden_field_tag(fieldname, nil, class: "assetable-uploader-input")

    # Gallery preview
    preview = gallery_preview(fieldname)

    # Uploader HTML = preview + hidden input
    uploader_html = template.content_tag(:div, (gallery_hidden_input + preview.html_safe), class: "uploader-assets-wrapper")

    # Create and return the uploader html
    uploader_wrapper = template.content_tag :div, (uploader_html + hidden_input + directions_html.html_safe), class: "gallery-uploader"
    return uploader_wrapper
  end

end