# frozen_string_literal: true

module Api
  module V1
    class SlidesController < ApplicationController
      before_action :set_slide, only: %i[show update destroy]

      def index
        @organization = Organization.find(params[:organization_id])
        @slides = @organization.slides.all
        render json: SlideSerializer.new(@slides).serializable_hash
      end

      def show
        if @slide
          render json: SlideSerializer.new(@slide).serializable_hash
        else
          render_error
        end
      end

      def update
        if @slide.update(slide_params)
          render json: SlideSerializer.new(@slide).serializable_hash
        else
          render json: @slide.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @slide.discarded?
          @slide.destroy
        else
          @slide.discard
        end
      end

      private

      def set_slide
        @slide = Slide.find(params[:id])
      end

      def slide_params
        params.require(:slide).permit(:text, :order, :organization_id)
      end

      def render_error
        render json: { errors: @slide.errors.full_messages }, status: :not_found
      end
    end
  end
end
