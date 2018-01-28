module V1
  class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def index
      users = User.all.limit(10)
      render json: users
    end

    def show
      render json: @user
    end

    def me
      user = User.find(current_user.id)
      render json: current_user, serializer: ::V1::UserSerializer
    end

    private

      def set_user
        @user = User.find(params[:id])
      end
  end
end
