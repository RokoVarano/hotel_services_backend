class Api::V1::ReservationsController < ApplicationController
  def index
    render json: {
      user_id: 1,
      reservations: [
        {
          reservation_id: 1,
          date: {
            day: 14,
            month: 4,
            year: 2021
          },
          service_name: 'Pool time',
          service_description: 'Bring your own towel',
          image_url: 'https://picsum.photos/200/300',
          city: 'Los Angeles'
        },
        {
          reservation_id: 2,
          date: {
            day: 15,
            month: 5,
            year: 2021
          },
          service_name: 'Conference Room',
          service_description: 'Make an impression on your customers!',
          image_url: 'https://picsum.photos/200/300',
          city: 'Prague'
        },
        {
          reservation_id: 1,
          date: {
            day: 29,
            month: 2,
            year: 2024
          },
          service_name: 'Bedroom',
          service_description: 'Sleep pretty darling do not cry, and I will sing a lullaby',
          image_url: 'https://picsum.photos/200/300',
          city: 'Bucharest'
        }
      ]
    }.to_json
  end
end
