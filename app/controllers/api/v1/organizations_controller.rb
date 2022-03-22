# frozen_string_literal: true

module Api
  module V1
    class OrganizationsController < ApplicationController
      def public
        @organization = Organization.find(params[:id])
        render json: OrganizationSerializer.new(@organization).serializable_hash
      end
    end
  end
end
