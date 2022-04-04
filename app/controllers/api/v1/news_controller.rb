# frozen_string_literal: true

module Api
  module V1
    class NewsController < ApplicationController
      before_action :set_news, only: %i[update]

      def update
        if @news.update(news_params)
          render json: NewSerializer.new(@news).serializable_hash, status: :ok
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      private

      def set_news
        @news = News.find(params[:id])
      end

      def news_params
        params.require(:news).permit(:image, :name, :content, :category_id)
      end
    end
  end
end
