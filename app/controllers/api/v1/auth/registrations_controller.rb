# frozen_string_literal: true

module Api
  module V1
    module Auth
      class RegistrationsController < ApplicationController
        include CreateSession

        def create
          @user = User.new(registration_params)
          @user.role = Role.create_or_find_by(name: 'user')

          @user.save ? success_user_created : error_user_save
        end

        private

        def success_user_created
          render status: :created, json: UserSerializer.new(@user).serializable_hash.to_json
        end

        def error_user_save
          render status: :unprocessable_entity, json: { errors: @user.errors.full_messages }
        end

        def registration_params
          params.require(:user).permit(
            :first_name, :last_name, :email, :password
          )
        end
      end
    end
  end
end
