# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < ApplicationController
        skip_before_action :authenticate_user!, only: %i[create]
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

        def destroy
          current_user.sessions.delete
          logout
        end

        private

        def success_session_created
          response.headers['Authorization'] = "Bearer #{@token}"
          render status: :created, json: {
            token: @token,
            message: "Has iniciado sesión correctamente #{@user.first_name}"
          }
        end

        def logout
          response.headers['Authorization'] = ''
          render status: :ok, json: {
            message: 'Haz cerrado sesión'
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
