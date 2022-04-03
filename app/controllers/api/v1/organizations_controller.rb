# frozen_string_literal: true

module Api
  module V1
    class OrganizationsController < ApplicationController
      before_action :is_admin?, only: %i[create]

      def create
        @organization = Organization.new(organization_params)
        if @organization.save
          render json: OrganizationSerializer.new(@organization).seriarizable_hash, status: :ok
        else
          render json: @organization.errors, status: :unprocessable_entity
        end
      end

      def public
        @organization = Organization.find(params[:id])
        render json: OrganizationSerializer.new(@organization).serializable_hash
      end

      private

      def organization_params
        params.require(:organization).permit(
          :image,
          :name,
          :address,
          :phone,
          :email,
          :welcome_text,
          :about_us_text
        )
      end
    end
  end
end
