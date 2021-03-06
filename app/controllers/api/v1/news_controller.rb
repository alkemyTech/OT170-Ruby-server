# frozen_string_literal: true

module Api
  module V1
    class NewsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]
      before_action :set_news, only: %i[show update destroy]
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def index
        @pagy, @news = pagy(News.all, page: params[:page] || 1)
        render json: NewsSerializer.new(@news).serializable_hash
      end

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
        @news.discard
        head :no_content
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
