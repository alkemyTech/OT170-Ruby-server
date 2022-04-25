# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApplicationController
      skip_before_action :authenticate_user!, only: %i[index]
      before_action :set_member, only: %i[show update destroy]
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def index
        @pagy, @member = pagy(Member.all, page: params[:page] || 1)
        render json: MemberSerializer.new(@member).serializable_hash
      end

      def show
        if @member
          render json: MemberSerializer.new(@member).serializable_hash, status: :ok
        else
          render_error
        end
      end

      def create
        @member = Member.new(member_params)
        if @member.save
          render json: MemberSerializer.new(@member).serializable_hash, status: :created
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end

      def update
        @member.discarded_at = nil
        if @member.update(member_params)
          render json: MemberSerializer.new(@member).serializable_hash
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @member.discard
        head :no_content
      end

      private

      def set_member
        @member = Member.find(params[:id])
      end

      def member_params
        params.require(:member).permit(:image, :name, :facebook_url, :instagram_url, :linkedin_url)
      end

      def render_error
        render json: { errors: @member.errors.full_messages }, status: :not_found
      end
    end
  end
end
