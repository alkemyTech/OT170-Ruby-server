# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :admin?, only: %i[index]
      before_action :set_user, only: %i[update destroy]
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def index
        @pagy, @users = pagy(User.all, page: params[:page] || 1)
        render json: UserSerializer.new(@users).serializable_hash
      end

      def update
        @user.discarded_at = nil
        if @user.update(user_profile_params)
          render json: UserSerializer.new(@user).serializable_hash
        else
          render json: @user.errors, status: :not_found
        end
      end

      def destroy
        @user.discard
        head :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_profile_params
        params.require(:user).permit(
          :first_name, :last_name, :email, :password, :password_confirmation
        )
      end
    end
  end
end
