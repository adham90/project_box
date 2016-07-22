module V1
  class UsersController < ApiController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      render json: User.all
    end

    def show
      render json: @user
    end

    def create
      user = User.create!(user_params)
      render json: { token: user.token }, status: :created
    end

    def update
      @user.update!(user_params)
      render json: @user
    end

    def destroy
      @user.destroy
    end

    private

    def set_user
      @user = User.find_by!(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
