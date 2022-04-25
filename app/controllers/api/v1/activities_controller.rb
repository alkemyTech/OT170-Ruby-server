# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]
      before_action :set_activity, only: %i[update]
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def index
        @pagy, @activity = pagy(Activity.all, page: params[:page] || 1)
        render json: ActivitySerializer.new(@activity).serializable_hash
      end

      def create
        @activity = Activity.new(activity_params)
        if @activity.save
          render json: ActivitySerializer.new(@activity).serializable_hash, status: :created
        else
          render json: @activity.errors, status: :unprocessable_entity
        end
      end

      def update
        if @activity.update(activity_params)
          render json: ActivitySerializer.new(@activity).serializable_hash, status: :created
        else
          render json: @activity.errors, status: :not_found
        end
      end

      private

      def set_activity
        @activity = Activity.find(params[:id])
      end

      def activity_params
        params.require(:activity).permit(:image, :name, :content)
      end
    end
  end
end
