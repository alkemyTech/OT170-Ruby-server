# frozen_string_literal: true

module Api
  module V1
    class NewsController < ApplicationController
      before_action :set_news, only: %i[show update destroy]
      
      def show
      
        if @news
          render json: NewsSerializer.new(@news).serializable_hash, status: :ok
        else
          render_error
        end
      end

      def create
        @news = News.new(news_params)
        @news.news_type = 'news'
        if @news.save
          render json: NewsSerializer.new(@news).serializable_hash, status: :created
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      def update
        if @news.update(news_params)
          render json: NewsSerializer.new(@news).serializable_hash, status: :ok
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @news.discarded?
          @news.destroy
        else
          @news.discard
        end
      end

      private

      def set_news
        @news = News.find(params[:id])
      end

      def news_params
        params.require(:news).permit(:image, :name, :content, :category_id)
      end

      def render_error
        render json: { errors: @news.errors.full_messages }, status: :not_found
      end
    end
  end
end
