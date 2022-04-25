# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update destroy]
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def index
        @pagy, @category = pagy(Category.all, page: params[:page] || 1)
        render json: CategorySerializer.new(@category).serializable_hash
      end

      def show
        if @category
          render json: CategorySerializer.new(@category).serializable_hash, status: :ok
        else
          render_error
        end
      end

      def create
        @category = Category.new(category_params)
        if @category.save
          render json: CategorySerializer.new(@category).serializable_hash, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def update
        if @category.update(category_params)
          render json: CategorySerializer.new(@category).serializable_hash
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @category.discard
        head :no_content
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:image, :name, :description)
      end

      def render_error
        render json: { errors: @category.errors.full_messages }, status: :not_found
      end
    end
  end
end
