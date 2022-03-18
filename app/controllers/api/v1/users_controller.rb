# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate!, only: :create

      def index
        users = User.all
        render json: users.as_json(json_options)
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user.as_json(json_options)
        else
          render json: { status: :bad, errors: user.errors.messages }
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :image)
      end

      def json_options
        { except: %i[created_at updated_at password_digest] }
      end
    end
  end
end
