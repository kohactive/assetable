class Assetable::ExternalServicesController < ActionController::Base

  respond_to :html, :js

  # def index
  #   @assets = Asset.page(params[:page]).per(20)
  #   render json: { success: true, html: render_to_string(partial: "assetable/assets/gallery", locals: {assets: @assets, fieldname: params[:fieldname]})}
  # end

  # New template
  def new
    @external_service = Assetabler::ExternalService.new
    @fieldname = params[:fieldname]
    @uploader_id = params[:uploader_id]
  end

  # Create a new external service asset
  def create
    @external_service = Assetabler::ExternalService.new(permitted_params)

    if @external_service.errors.empty? and @external_service.save
      @fieldname = params[:fieldname]
      @uploader_id = params[:uploader_id]
      render :create
    else
      render :error
    end
  end

  # Permitted params for the model
  def permitted_params
    params.require(:external_service).permit(
      :name,
      :filename,
      :body,
      :content_type,
      :width,
      :height,
      :uploader_id
    )
  end

end