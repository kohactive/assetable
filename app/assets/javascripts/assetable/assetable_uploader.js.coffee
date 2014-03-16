(($) ->
  $.fn.assetable_uploader = (options) ->
    
    # Defaults variables
    defaults =
      allow_select_mg: true
      authenticity_token: null
      directions: 'or <a href="/assetable/external_services/new" class="btn-third-party-service">add third party service</a>'
      drag_drop: true
      fieldname: null
      FileUploaded: options.onUploaded
      fileRemoved: options.fileRemoved
      fileUpdated: options.fileUpdated
      gallery: false
      id: null
      max_file_size: options.max_file_size
      multiple_queues: true
      multi_selection: true
      max_file_count: 0
      unique_names: true
      url: null
      uploader_id: null
    
    assetable_uploader = this

    init = ->
      # merge the options with the defaults
      assetable_uploader.options = jQuery.extend({}, defaults, options)
      
      hidden_field = $(assetable_uploader).find('input[type="hidden"].assetable-uploader-input')
      assetable_uploader.options.fieldname = hidden_field.attr('name')
      assetable_uploader.options.uploader_id = hidden_field.attr('id')
      $(hidden_field, assetable_uploader).remove() if assetable_uploader.options.gallery

      $(assetable_uploader).attr('id', assetable_uploader.options.uploader_id)
      $(assetable_uploader).find('.browse-btn').attr('id', "#{assetable_uploader.options.uploader_id}-browse-btn")
      $(assetable_uploader).find('.drop-element').attr('id', "#{assetable_uploader.options.uploader_id}-drop-element")
      
      # Add parameters to third party button
      third_party_btn = $(assetable_uploader).find('.btn-third-party')
      $(third_party_btn).attr('href', $(third_party_btn).attr('href') + "?fieldname=#{assetable_uploader.options.fieldname}&uploader_id=#{assetable_uploader.options.uploader_id}")

      bind_uploader()

    
    bind_uploader = ->

      # Create our extra HTML for the copy and queu
      upload_queue = '<ul class="upload-queue"></ul>'
      # Add to the uploader
      $(assetable_uploader).append(upload_queue)


      # Instantiate the uploader
      uploader = new plupload.Uploader(
        runtimes: "html5"
        browse_button: "#{assetable_uploader.options.uploader_id}-browse-btn"
        url: assetable_uploader.options.url
        max_file_size: assetable_uploader.options.max_file_size
        unique_names: assetable_uploader.options.unique_names
        dragdrop: assetable_uploader.options.drag_drop
        drop_element: assetable_uploader.options.uploader_id
        multiple_queues: assetable_uploader.options.multiple_queues
        multi_selection: assetable_uploader.options.multi_selection
        max_file_count: assetable_uploader.options.max_file_count
        multipart: true
        multipart_params:
          authenticity_token: assetable_uploader.options.authenticity_token
          fieldname: assetable_uploader.options.fieldname
          gallery: assetable_uploader.options.gallery
          uploader_id: assetable_uploader.options.uploader_id

        # Filter file types
        filters:
          mime_types : [
            title: "Image files"
            extensions: "jpg,gif,png"
          ,
            title: "Video files"
            extensions: "mov,mp4,mpeg4"
          ,
            title: "Zip Files"
            extensions: "zip"
          ,
            title: "Documents"
            extensions: "pdf, doc, docx, xls, xlsx"
          ]
          max_file_size: assetable_uploader.options.max_file_size
          prevent_duplicates: true
      )  
      
      
      # # Initiate the uploader
      uploader.init()
      
      # Bind to file added function
      uploader.bind "FilesAdded", (up, files) ->
        $.each files, (i, file) ->
          $("ul.upload-queue", assetable_uploader).append '<li id="' + file.id + '"><span class="uploader-file-name">' + file.name + '</span><div class="progress progress"><div class="progress-bar progress-bar-success"></div></div></li>'

          
      # Update the progress bars
      uploader.bind "UploadProgress", (up, file) ->
        $("li#" + file.id + " .progress .progress-bar", assetable_uploader).width file.percent + "%"

      
      # Listen for upload complete
      uploader.bind "FileUploaded", (up, file, info) ->
        eval(info.response)
        $("li#" + file.id, assetable_uploader).fadeOut().remove()

      
      # Listen for queue changes
      uploader.bind "QueueChanged", (up, files) ->
        uploader.start()
        up.refresh()
      
      # # Listen for errors
      uploader.bind "Error", (up, err) ->
        


      draggable_selector = (if assetable_uploader.options.gallery then $('.uploader-directions', assetable_uploader) else $(assetable_uploader))

      # Handle the drag over effect, adds a class to the container
      $(draggable_selector).bind "dragover", ->
        $(this).addClass "droppable" unless $(this).hasClass("droppable")

      # Handles drag leave 
      $(draggable_selector).on "dragleave", ->
        $(this).removeClass "droppable" if $(this).hasClass("droppable")

      $(draggable_selector).on "dragend", ->
        $(this).removeClass "droppable" if $(this).hasClass("droppable")

      $(draggable_selector).on "drop", ->
        $(this).removeClass "droppable" if $(this).hasClass("droppable")




      # Remove asset link handler
      $(assetable_uploader).on "click", ".btn-uploader-remove-asset", (e)->
        e.preventDefault()
        if assetable_uploader.options.fileRemoved
          assetable_uploader.options.fileRemoved assetable_uploader, this



      $(assetable_uploader).on "click", ".btn-open-asset-gallery", (e)->
        e.preventDefault()
        $(assetable_uploader).asset_gallery({fieldname: assetable_uploader.options.fieldname})
        # if assetable_uploader.options.openAssetGallery
        #   assetable_uploader.options.openAssetGallery this, assetable_uploader
      
    

    init()

) jQuery