class Api::V1::UsersController < ApplicationController
  def show_by_name

  end

  def create
    render json: { message: 'User was successfully created',
                   user_id: 42 }.to_json
  end
end
