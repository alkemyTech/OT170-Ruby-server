# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]
      before_action :set_comment, only: %i[show update destroy]

      def index
        if params[:news_id]
          news = News.find(params[:news_id])
          comments = news.comments
          render json: CommentSerializer.new(comments).serializable_hash
        else
          @comment = Comment.order(created_at: :desc)
          render json: CommentSerializer.new(@comment).serializable_hash
        end
      end

      def show
        if @comment
          render json: CommentSerializer.new(@comment).serializable_hash, status: :ok
        else
          render_not_found
        end
      end

      def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
          render json: CommentSerializer.new(@comment).serializable_hash, status: :created
        else
          render_unprocessable_entity
        end
      end

      def update
        @comment.discarded_at = nil
        if current_user.id == @comment.user_id
          if @comment.update(comment_params)
            render json: CommentSerializer.new(@comment).serializable_hash, status: :ok
          else
            render_unprocessable_entity
          end
        else
          render_unauthorized
        end
      end

      def destroy
        if current_user.id == @comment.user_id
          @comment.discard
          head :no_content
        else
          render_unauthorized
        end
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:news_id, :body)
      end

      def render_unauthorized
        render status: :unauthorized, json: {
          errors: [I18n.t('errors.controllers.unauthorized')]
        }
      end

      def render_unprocessable_entity
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end

      def render_not_found
        render json: { errors: @comment.errors.full_messages }, status: :not_found
      end
    end
  end
end
