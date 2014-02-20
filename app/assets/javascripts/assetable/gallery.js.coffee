bind_galleries = ->

  # Bind the koh uploader and galleries to a page
  $(".gallery-uploader").each ->
    # Check that it's not already bound
    unless $(this).hasClass("uploadable")
      $(this).addClass "uploadable"
      $this = $(this)
      $this.removeClass "uploader"

      $this.assetable_uploader
        multi_selection: true
        gallery: true
        url: "/assetable/assets.js"
        authenticity_token: $("meta[name=\"csrf-token\"]").attr("content")
        fileRemoved: (item, button) ->
          $(button).parentsUntil('.uploader-preview').parent().find('.assetable-gallery-item-remove').val('1')
          $(button).parentsUntil('.uploader-preview').parent().fadeOut()


        # Make the gallery sortable
        $(this).sortable
          items: "div.uploader-preview"
          distance: 50
          tolerance: 'pointer'
          placeholder: 'uploader-sortable-placeholder'
          update: (event, ui) ->
            $gallery = $(this)

            $('input.assetable-gallery-item-sort-order', $gallery).each (index) ->
              $(this).val(index)


window.Assetable.bind_galleries = bind_galleries


$(document).ready ->

  window.Assetable.bind_galleries()

