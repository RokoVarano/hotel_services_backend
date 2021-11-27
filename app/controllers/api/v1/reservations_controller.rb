class Api::V1::ReservationsController < ApplicationController
  def index
    user = User.find(params[:id])
    reservations = user.reservations

    render json: {
      user_id: user.id,
      reservations: reservations
    }.to_json, status: :ok
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
    reservation = Reservation.find_by(id: params[:id])

    if reservation
      reservation.destroy
      render json: { message: 'Your reservation has been canceled' }.to_json,
             status: :accepted
    else
      render json: { errors: ['Not a current reservation'] }.to_json,
             status: :not_found
    end
  end

  private

  def new_reservation_params
    params.require(:reservation).permit(:city, date: %i[day month year])
  end

  def date_from_params
    date_hash = new_reservation_params['date']
    day = date_hash['day']
    month = date_hash['month']
    year = date_hash['year']
    begin
      Date.parse("#{day}-#{month}-#{year}")
    rescue StandardError
      nil
    end
  end

  def city_param
    new_reservation_params['city']
  end
end
