# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < ApplicationController
        skip_before_action :authenticate_user!
        include CreateSession

        def create
          @user = User.find_by(email: params[:user][:email])

          if @user && @user&.authenticate(params[:user][:password])
            @token = jwt_session_create(@user)
            return success_session_created if @token

            error_token_create
          else
            error_invalid_credentials
          end
        end

        private

        def success_session_created
          response.headers['Authorization'] = "Bearer #{@token}"
          render status: :created, json: {
            token: @token,
            user: UserSerializer.new(@user).serializable_hash
          }
        end

        def error_invalid_credentials
          render status: :unauthorized, json: {
            errors: [I18n.t('errors.controllers.auth.invalid_credentials')]
          }
        end

        def error_token_create
          render status: :unprocessable_entity, json: {
            errors: [I18n.t('errors.controllers.auth.token_not_created')]
          }
        end
      end
    end
  end
end
