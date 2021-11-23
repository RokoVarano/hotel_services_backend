require 'rails_helper'

RSpec.describe 'User endpoints tests', type: :request do
  let!(:user) { create(:user) }

  describe 'User Log In' do
    it 'Succeeds for a valid user' do
      get "/api/v1/users?name=#{user.name}"

      expect(response).to have_http_status(:accepted)
      expect(response.body).to include_json(
        user_id: user.id
      )
    end

    it 'Fails for an invalid user' do
      get '/api/v1/users?name=john'

      expect(response).to have_http_status(:unauthorized)
      expect(response.body).to include_json(
        error: "User doesn't exist"
      )
    end
  end

  describe 'User sign up' do
    let!(:user) { create(:user) }

    it 'Succeeds for a new user name' do
      headers = {
        'HTTP_ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json'
      }
      post '/api/v1/users', params: { { name: 'John Snow' } },
           headers: headers

      expect(response).to have_http_status(:created)
      expect(response.body).to include_json(
        message: 'User was successfully created'
      )
      expect(JSON.parse(response.body).keys).to include('user_id')
    end

    it 'Fails for an already taken user name' do
      headers = {
        'HTTP_ACCEPT' => 'application/json',
        'CONTENT_TYPE' => 'application/json'
      }
      post '/api/v1/users', params: { name: user.name }, headers: headers

      expect(response).to have_http_status(:conflict)
      expect(response.body).to include_json(
        error: 'Usename already taken'
      )
    end
  end
end
