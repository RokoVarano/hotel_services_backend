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
end
