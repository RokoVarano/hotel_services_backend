class Api::V1::ServicesController < ApplicationController

  def index
    services = Service.all.order("created_at DESC")
    render json: { services: services }.to_json
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      render json: { message: 'Service has been created' }.to_json
    else
      render json: { message: 'Service was not created' }.to_json
    end
  end

  def delete
    @service = Service.find(params[:id])
    if @service.destroy
      render json: { message: 'Service has been deleted' }.to_json
    else
      render json: { message: 'No action was taken' }.to_json
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :description, :price, :image_url)
  end
end
