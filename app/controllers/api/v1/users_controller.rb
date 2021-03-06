class Api::V1::UsersController < ApplicationController
  def log_in
    user = User.find_by(name: params[:name])
    if user
      render json: {
        message: 'User logged in',
        user_id: user.id
      }.to_json,
             status: :accepted
    else
      render json: { errors: ["User doesn't exist"] }.to_json,
             status: :unauthorized
    end
  end

  def create
    new_user = User.new(new_user_params)
    if new_user.save
      render json: {
        message: 'User was successfully created',
        user_id: new_user.id
      }.to_json,
             status: :created
    else
      render json: {
        errors: new_user.errors.full_messages
      }.to_json,
             status: :conflict
    end
  end

  private

  def new_user_params
    params.require(:user).permit(:name)
  end
end
