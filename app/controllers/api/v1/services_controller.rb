class Api::V1::ServicesController < ApplicationController
  def index
    render json: {
             services: [
               {
                 id: 1,
                 name: 'Pool time',
                 description: 'Bring your own towel',
                 price: 1000,
                 image_url: "https://picsum.photos/200/300"
               },
               {
                 id: 2,
                 name: 'Conference Room',
                 description: 'Make an impression on your customers!',
                 price: 5000,
                 image_url: "https://picsum.photos/200/300"
               },
               {
                 id: 3,
                 name: 'Bedroom',
                 description: 'Sleep pretty darling do not cry, and I will sing a lullaby',
                 price: 3000,
                 image_url: "https://picsum.photos/200/300"
               }
             ]
           }.to_json
  end

  def create
    render json: { message: 'Service has been created' }.to_json
  end

  def destroy
    render json: { message: 'Service has been deleted' }.to_json
  end
end
