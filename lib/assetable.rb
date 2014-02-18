require "carrierwave"
require "fog"
require "plupload-rails"
require "kaminari"

require "haml-rails"
require "sass-rails"
require "jquery-rails"

require "assetable/core"
require "assetable/engine"
require "assetable/config"

require "assetable/inputs/form_helper"
require "assetable/inputs/uploader_input"
require "assetable/inputs/gallery_input"

module Assetable

  extend Config

end