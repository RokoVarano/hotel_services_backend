class Api::V1::ServicesController < ApplicationController
  def index
    services = Service.all.order('created_at DESC')
    render status: 200, json: { services: services }.to_json
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      render status: 201, json: { message: 'Service has been created' }.to_json
    else
      render status: 500, json: { message: 'Service creation has failed' }.to_json
    end
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      render status: 202, json: { message: 'Service has been deleted' }.to_json
    else
      render status: 500, json: { message: 'No action was taken' }.to_json
    end
  end

  private
  def service_params
    params.require(:service).permit(:name, :description, :price, :image_url)
  end
end
