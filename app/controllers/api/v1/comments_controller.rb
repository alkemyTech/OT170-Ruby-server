# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show update destroy]

      def index
        @comment = Comment.order(creation_at: desc)
        render json: CommentSerializer.new(@comment).serializable_hash
      end

      def show
        if @comment
          render json: commentSerializer.new(@comment).serializable_hash, status: :ok
        else
          render_error
        end
      end

      def create
        if current_user
          @comment = Comment.new(comment_params)
          @comment.user_id = current_user.id
          if @comment.save
            render json: CommentSerializer.new(@comment).serializable_hash, status: :created
          else
            render json: @comment.errors, status: :unprocessable_entity
          end
        else
          authenticate_user!
        end
      end

      def update
        @comment.discarded_at = nil
        if @comment.update(comment_params)
          render json: CommentSerializer.new(@comment).serializable_hash
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if current_user.id == @comment.user_id
          @comment.discard
          head :no_content
        else
          render status: :unauthorized, json: {
            errors: [I18n.t('errors.controllers.auth.unauthenticated')]
          }
        end
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:news_id, :body)
      end

      def render_error
        render json: { errors: @comment.errors.full_messages }, status: :not_found
      end
    end
  end
end
