$(document).ready ->

  # Bind the koh uploader and galleries to a page
  $(".gallery-uploader").each ->
    
    # Check that it's not already bound
    unless $(this).hasClass("uploadable")
      $(this).addClass "uploadable"
      $this = $(this)
      $this.removeClass "uploader"
      
      field = $this.attr("data-uploader-input-name")

      $this.assetable_uploader
        multi_selection: true
        gallery: true
        url: "/assetable/assets"
        fieldname: field
        authenticity_token: $("meta[name=\"csrf-token\"]").attr("content")
        onUploaded: (resp) ->
          $this.find('.uploadar-data-wrapper').append(resp.html)
        fileRemoved: (button, item) ->
          $(button).closest('.uploader-preview').remove()
        fileUpdated: (resp) ->
          $this.find('div.uploader-preview[data-asset-id="' + resp.id + '"]').replaceWith(resp.html)



        # Make the gallery sortable
        $(this).sortable
          items: "div.uploader-preview"
          distance: 50
          tolerance: 'pointer'
          placeholder: 'uploader-sortable-placeholder'

