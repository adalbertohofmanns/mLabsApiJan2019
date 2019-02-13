class Api::V1::UsersController < ApplicationController

  respond_to :json
  # POST /api/v1/users
  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Params Permitted.
  def user_params
    params.require(:user).permit(:name, :cpf, :email, :password)
  end

end
