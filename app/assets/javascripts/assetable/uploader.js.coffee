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
        fileRemoved: (item, button) ->
          # Remove the asset preview and input when removed. No need
          # to add an empty input as one already exists in the DOM
          $('.uploader-preview', item).html('')


window.Assetable.bind_uploaders = bind_uploaders

$(document).ready ->
            
  window.Assetable.bind_uploaders()

  # Remove assetable modals on close
  $(document).on "hidden.bs.modal", ".assetable-modal", ->
    $(this).remove()
    return
