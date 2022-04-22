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
      # POST /users or /users.json
      def create
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            # Tell the UserMailer to send a welcome email after save
            UserMailer.with(user: @user).welcome_email.deliver_later

            format.json { render json: @user, status: :created, location: @user }
          else
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
      # private

      # def set_user
      #   @user = User.find(params[:id])
      # end
    end
  end
end
