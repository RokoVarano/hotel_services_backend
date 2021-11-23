require 'rails_helper'

RSpec.describe 'Reservations-related endpoints tests', type: :request do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user, name: 'User 2') }
  let!(:service1) { create(:service, name: 'Test service 1') }
  let!(:service2) { create(:service, name: 'Test service 2') }
  let!(:reservation11) do
    create(:reservation, user_id: user1.id, service_id: service1.id)
  end
  let!(:reservation12) do
    create(:reservation, user_id: user1.id, service_id: service2.id)
  end

  describe "List a given user's reservations" do
    it "Returns the list of the user's reservations" do
      get "/api/v1/users/#{user1.id}/reservations"

      reservations = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(reservations['user_id']).to eq(user1.id)
      expect(reservations['reservations'].length).to eq(2)
    end

    it 'Reservations data has the correct info' do
      get "/api/v1/users/#{user1.id}/reservations"

      expect(response).to have_http_status(:ok)
      expect_json_types(
        'reservations.0',
        reservation_id: :int,
        service_name: :string,
        service_description: :string,
        image_url: :string,
        city: :string
      )
      expect_json_types(
        'reservations.*.date',
        day: :int,
        month: :int,
        year: :int
      )
    end
  end

  describe 'Book a given service' do
    it 'Successfully books a service' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      body = { reservation: {
        city: 'Manila',
        date: {
          day: 1,
          month: 10,
          year: 2022
        }
      } }
      post "/api/v1/users/#{user2.id}/services/#{service1.id}/reservation",
           params: body,
           headers: headers

      expect(response).to have_http_status(:created)
      expect(response.body).to include_json(
        message: 'Reservation has been created'
      )
    end

    it 'Fails to book a service with an invalid date' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      body = { reservation: {
        city: 'Manila',
        date: {
          day: 30,
          month: 2,
          year: 2022
        }
      } }
      post "/api/v1/users/#{user2.id}/services/#{service1.id}/reservation",
           params: body,
           headers: headers

      expect(response).to have_http_status(:bad_request)
      expect_json_types('errors', :array)
    end

    it 'Fails to book a service with an invalid user' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      body = { reservation: {
        city: 'Manila',
        date: {
          day: 1,
          month: 2,
          year: 2022
        }
      } }
      post "/api/v1/users/#{user2.id + 1}/services/#{service1.id}/reservation",
           params: body,
           headers: headers

      expect(response).to have_http_status(:not_found)
      expect_json_types('errors', :array)
    end

    it 'Fails to book an invalid service' do
      headers = {
        'HTTP_ACCEPT' => 'application/json'
      }
      body = { reservation: {
        city: 'Manila',
        date: {
          day: 1,
          month: 2,
          year: 2022
        }
      } }
      post "/api/v1/users/#{user2.id}/services/#{service2.id + 1}/reservation",
           params: body,
           headers: headers

      expect(response).to have_http_status(:not_found)
      expect_json_types('errors', :array)
    end
  end

  describe 'Cancel a reservation' do
    it 'Cancels a valid reservation' do
      delete "/api/v1/reservations/#{reservation11.id}"

      expect(response).to have_http_status(:accepted)
      expect_json(message: 'Your reservation has been canceled')
    end

    it 'Fails to cancel an invalid reservation' do
      delete "/api/v1/reservations/#{reservation12.id + 1}"

      expect(response).to have_http_status(:not_found)
      expect_json_types('errors', :array)
    end
  end
end
