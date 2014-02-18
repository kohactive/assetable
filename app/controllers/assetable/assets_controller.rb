class Assetable::AssetsController < ActionController::Base

  respond_to :html, :js

  def index
    @assets = Asset.page(params[:page]).per(20)
    # render json: { success: true, html: render_to_string(partial: "assetable/assets/gallery", locals: {assets: @assets, fieldname: params[:fieldname]})}
  end

  # Create a new asset
  def create
    # Get the content type
    content_type = params[:file].content_type
    asset_params = {name: params[:file].original_filename, filename: params[:file]}

    # Create the appropriate model
    if content_type.split("/").first == "image"
      @asset = Image.new(asset_params)
    elsif content_type.split("/").first == "video"
      @asset = Video.new(asset_params)
    elsif content_type.split("/").first == "application"
      @asset = Document.new(asset_params)
    end

    # # Return
    if @asset.errors.empty? and @asset.save
      @fieldname = params[:fieldname]
      @uploader_id = params[:uploader_id]
      render :create
    else
      render :error
    end
  end

  # Edit an asset will return the edit form
  def edit
    @asset = Asset.find(params[:id])
  end

  # Update an asset
  def update
    @asset = Asset.find(params[:id])
    @asset.update_attributes(permitted_params)
    @fieldname = params[:fieldname]
  end

  # Permitted params for the model
  def permitted_params
    params.require(params[:asset_type].underscore.to_sym).permit(
      :name,
      :filename,
      :body,
      :content_type,
      :width,
      :height,
      :asset_type,
      :ratio
    )
  end

end