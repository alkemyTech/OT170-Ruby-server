# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user

      # DELETE /users/:id
      def destroy
        @user.discard
        head :no_content
      end

      private

      # Set user instance
      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
