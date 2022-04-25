# frozen_string_literal: true

module Api
  module V1
    class TestimonialsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]
      before_action :set_testimonial, only: %i[show update destroy]
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def index
        @pagy, @testimonial = pagy(Testimonial.all, page: params[:page] || 1)
        render json: TestimonialSerializer.new(@testimonial).serializable_hash
      end

      def show
        if @testimonial
          render json: TestimonialSerializer.new(@testimonial).serializable_hash, status: :ok
        else
          render_error
        end
      end

      def create
        @testimonial = Testimonial.new(testimonial_params)
        if @testimonial.save
          render json: TestimonialSerializer.new(@testimonial).serializable_hash, status: :created
        else
          render json: @testimonial.errors, status: :unprocessable_entity
        end
      end

      def update
        @testimonial.discarded_at = nil
        if @testimonial.update(testimonial_params)
          render json: TestimonialSerializer.new(@testimonial).serializable_hash
        else
          render json: @testimonial.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @testimonial.discard
        head :no_content
      end

      private

      def set_testimonial
        @testimonial = Testimonial.find(params[:id])
      end

      def testimonial_params
        params.require(:testimonial).permit(:image, :name, :content)
      end

      def render_error
        render json: { errors: @testimonial.errors.full_messages }, status: :not_found
      end
    end
  end
end
