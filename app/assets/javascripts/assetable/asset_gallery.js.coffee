(($) ->
  $.fn.asset_gallery = (options) ->
    
    # Defaults variables
    defaults =
      base_path: "/assetable/assets"
      fieldname: null
      gallery_open: false
      gallery: null
      
    
    asset_gallery = this

    init = ->
      console.log "init!!"
      # merge the options with the defaults
      asset_gallery.options = jQuery.extend({}, defaults, options)
      asset_gallery.load_page(1)


    template = (html)->
      backdrop = '<div class="assetable-gallery-backdrop"></div>'
      wrapper = '<div class="assetable-gallery-wrapper">' + html + '</div>'
      asset_gallery.gallery = $(wrapper)
      return backdrop + wrapper


    asset_gallery.load_page = (page)->
      console.log "page:: ", page
      if page > 1 then path = (asset_gallery.options.base_path + "/page/" + path) else path = asset_gallery.options.base_path

      $.get path, {fieldname: asset_gallery.options.fieldname}, (data) ->
        console.log "data:: ", data
        if page > 1
          $('.assetable-gallery', asset_gallery).html(data.html)
        else
          $('body').append(template(data.html))

        bind_pagination(asset_gallery.gallery)
        asset_gallery.bind_close_button()


    bind_pagination = (gallery)->
      console.log "bind pagination!!...", gallery
      console.log $('.assetable-gallery-paginate a', gallery)

      $('.assetable-gallery-paginate a', gallery).on "ajax:beforeSend", (event, xhr, settings) ->
        console.log "event:: ", event
        console.log "before send!!"

      $('.assetable-gallery-paginate a', gallery).on "ajax:success", (data, status, xhr) ->
        console.log "ajax success!!"
        console.log "data:: ", data
        console.log "status:: ", status


    asset_gallery.bind_close_button = ()->
      console.log "bound close button::, ", $(asset_gallery.gallery)
      $('.btn-close-assetable-gallery', $(asset_gallery.gallery)).remove()
      $(asset_gallery.gallery).on "click", '.btn-close-assetable-gallery', (e) ->
        alert "fuck!"
        console.log "close button clicked!"
        e.preventDefault()
        asset_gallery.close()


    asset_gallery.close = ()->
      $(asset_gallery.gallery).fadeOut()



    init()

) jQuery