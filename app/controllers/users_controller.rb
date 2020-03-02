class UsersController < ApplicationController
  before_action :authorized, only: [:persist]

  # def profile
  #   render json: { user: UserSerializer.new(current_user) }, status: :accepted
  # end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), token: @token }, status: :created
    else
      render json: { error: 'Failed to create user' }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      wristband = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), token: wristband }, status: :accepted
    else
      render json: {error: "Invalid username or password"}, status: :unauthorized
    end
  end

  def persist
    wristband = encode_token({user_id: @user.id})
    render json: { user: UserSerializer.new(@user), token: wristband }
  end

  private
  def user_params
    params.permit(:username, :password)
  end

end
