# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user!

      # before_action :set_user, only: %i[index destroy]

      def index
        @users = User.all
        render json: UserSerializer.new(@users).serializable_hash
      end

      def destroy
        @user.discard
        head :no_content
      end

      # private

      # def set_user
      #   @user = User.find(params[:id])
      # end
    end
  end
end
