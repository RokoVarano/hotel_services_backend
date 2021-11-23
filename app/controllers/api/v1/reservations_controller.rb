class Api::V1::ReservationsController < ApplicationController
  def index
    render json: {
      user_id: 1,
      reservations: [
        {
          reservation_id: 1,
          date: {
            day: 14.0,
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

  def create
    date = date_from_params

    reservation = Reservation.new(
      user_id: params[:user_id],
      service_id: params[:service_id],
      date: date,
      city: city_param
    )

    if reservation.save
      render json: { message: 'Reservation has been created' }.to_json,
             status: :created
    elsif date
      render json: { errors: reservation.errors.full_messages }.to_json,
             status: :not_found
    else
      render json: { errors: ['Invalid date'] }.to_json,
             status: :bad_request
    end
  end

  def destroy
    render json: { message: 'Your reservation has been canceled' }.to_json
  end

  private

  def date_from_params
    date_hash = params.require(:reservation)
                  .permit(date: %i[day month year])['date']
    day = date_hash['day']
    month = date_hash['month']
    year = date_hash['year']
    Date.parse("#{day}-#{month}-#{year}") rescue nil
  end

  def city_param
    params.require(:reservation).permit(:city)
  end
end
