bind_uploaders = ->

  $('.assetable-uploader').each ->
    unless $(this).hasClass("uploadable")
      $(this).addClass "uploadable"
      $this = $(this)
      $this.removeClass "assetable-uploader"

      $this.assetable_uploader
        multi_selection: false
        url: "/assetable/assets.js"
        # directions: $this.attr('data-uploader-directions')
        # max_file_size: $this.attr("data-max-file-size")
        authenticity_token: $("meta[name=\"csrf-token\"]").attr("content")



  # # Bind the koh uploader and galleries to a page
  # $(".assetable-uploader").each ->
  #   # Check that it's not already bound
  #   unless $(this).hasClass("uploadable")
  #     $(this).addClass "uploadable"
  #     $this = $(this)
  #     $this.removeClass "uploader"
      
  #     field = $this.attr("data-uploader-input-name")
  #     uploader_id = $this.attr('id')

  #     $this.assetable_uploader
  #       multi_selection: false
  #       url: "/assetable/assets.js"
  #       fieldname: field
  #       uploader_id: uploader_id
  #       directions: $this.attr('data-uploader-directions')
  #       max_file_size: $this.attr("data-max-file-size")
  #       authenticity_token: $("meta[name=\"csrf-token\"]").attr("content")
  #       onUploaded: (resp) ->
  #         # $this.find('.uploader-data-wrapper').html(resp.html)
  #         # $this.addClass("uploader-has-asset")
  #       fileRemoved: (button, item) ->
  #         return false unless $(item).hasClass("uploader-has-asset")
  #         $('.uploader-preview', item).html('<input type="hidden" name="' + field + '" />')
  #         $(item).removeClass("uploader-has-asset")
  #       fileUpdated: (resp) ->
  #         $this.find('div.uploader-preview[data-asset-id="' + resp.id + '"]').replaceWith(resp.html)
  #       # openAssetGallery: (button, item) ->



window.Assetable.bind_uploaders = bind_uploaders

$(document).ready ->
            
  window.Assetable.bind_uploaders()

  # Remove assetable modals on close
  $(document).on "hidden.bs.modal", ".assetable-modal", ->
    $(this).remove()
    return
