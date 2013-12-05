class Assetable::AssetsController < ActionController::Base

  respond_to :html, :json

  def index
    @assets = Asset.page(params[:page]).per(20)
    render json: { success: true, html: render_to_string(partial: "assetable/assets/gallery", locals: {assets: @assets, fieldname: params[:fieldname]})}
  end

  # Create a new asset
  def create
    # Get the content type
    content_type = params[:file].content_type
    asset_params = {name: params[:file].original_filename, filename: params[:file]}

    puts "params:: #{params.inspect}"
    puts "content_type:: #{content_type}"

    # Create the appropriate model
    if content_type.split("/").first == "image"
      @asset = Image.new(asset_params)
    elsif content_type.split("/").first == "video"
      @asset = Video.new(asset_params)
    elsif content_type.split("/").first == "application"
      @asset = Document.new(asset_params)
    end

    puts "@asset:: #{@asset.inspect}"

    # Return
    if @asset.errors.empty? and @asset.save
      render json: { success: true, html: render_to_string(partial: "assetable/assets/asset", locals: { asset: @asset, fieldname: params[:fieldname]})}
    else
      render json: { status: "error", errors: @asset.errors }
    end
  end

end