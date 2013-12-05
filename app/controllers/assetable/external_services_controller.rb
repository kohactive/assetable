class Assetable::ExternalServicesController < ActionController::Base

  respond_to :html, :json

  # def index
  #   @assets = Asset.page(params[:page]).per(20)
  #   render json: { success: true, html: render_to_string(partial: "assetable/assets/gallery", locals: {assets: @assets, fieldname: params[:fieldname]})}
  # end

  # New template
  def new
    @external_service = ExternalService.new
  end

  # Create a new external service asset
  def create
    @external_service = ExternalService.new(permitted_params)

    if @external_service.errors.empty? and @external_service.save
      render json: { success: true, html: render_to_string(partial: "assetable/assets/asset", locals: { asset: @external_service, fieldname: params[:fieldname]})}
    else
      puts "errors:: #{@external_service.errors.full_messages}"
      render json: { status: "error", errors: @external_service.errors.full_messages, html: render_to_string(:new) }
    end
  end

  # Permitted params for the model
  def permitted_params
    params.require(:external_service).permit(
      :name,
      :body,
      :content_type
    )
  end

end