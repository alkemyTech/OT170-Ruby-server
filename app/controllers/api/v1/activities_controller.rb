# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < ApplicationController
      def create
        @activity = Activity.new(activity_params)

        if @activity.save
          render json: ActivitySerializer.new(@activity).serializable_hash, status: :created
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      private

      def activity_params
        params.require(:activity).permit(:image, :name, :content)
      end
    end
  end
end
