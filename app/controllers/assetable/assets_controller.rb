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

    # Create the appropriate model
    if content_type.split("/").first == "image"
      @asset = Image.new(asset_params)
    elsif content_type.split("/").first == "video"
      @asset = Video.new(asset_params)
    elsif content_type.split("/").first == "application"
      @asset = Document.new(asset_params)
    end

    # Return
    if @asset.errors.empty? and @asset.save
      render json: { success: true, html: render_to_string(partial: "assetable/assets/asset", locals: { asset: @asset, fieldname: params[:fieldname]})}
    else
      render json: { status: "error", errors: @asset.errors }
    end
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])
    if @asset and @asset.errors.empty? and @asset.update_attributes(permitted_params)
      render json: { success: true, id: @asset.id, html: render_to_string(partial: "assetable/assets/asset", locals: { asset: @asset, fieldname: params[:fieldname]})}
    else
      render json: { status: "error", errors: @external_service.errors.full_messages, html: render_to_string(:edit) }
    end
  end

  # Permitted params for the model
  def permitted_params
    params.require(params[:asset_type].downcase.to_sym).permit(
      :name,
      :filename,
      :body,
      :content_type,
      :width,
      :height,
      :asset_type
    )
  end

end