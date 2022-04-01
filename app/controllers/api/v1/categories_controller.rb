# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[update destroy]

      def create
        @category = Category.new(category_params)
        if @category.save
          render json: @category, status: :created, location: @category

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
    end
  end
end
