# frozen_string_literal: true

module Api
  module V1
    module Auth
      class UsersController < ApplicationController
        def me
          render json: UserSerializer.new(current_user).serializable_hash
        end
      end
    end
  end
end
