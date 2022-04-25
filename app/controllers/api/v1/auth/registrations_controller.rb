# frozen_string_literal: true

module Api
  module V1
    module Auth
      class RegistrationsController < ApplicationController
        skip_before_action :authenticate_user!
        include CreateSession

        def create
          @user = User.new(registration_params)
          create_role
          if @user.save
            @token = jwt_session_create(@user)
            return send_mail && success_user_created if @token

            error_token_create
          else
            error_user_save
          end
        end

        private

        def create_role
          role = Role.find_by(name: 'user')
          @user.role = role || Role.create(name: 'user', description: 'user role')
        end

        def success_user_created
          response.headers['Authorization'] = "Bearer #{@token}"
          render status: :created, json: {
            token: @token,
            message: 'Te has registrado con exito!'
          }
        end

        def send_mail
          UserMailer.with(user: @user).welcome_email.deliver_later
        end

        def registration_params
          params.require(:user).permit(
            :first_name, :last_name, :email, :password
          )
        end

        def error_user_save
          render status: :unprocessable_entity, json: { errors: @user.errors.full_messages }
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
