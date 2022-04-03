# frozen_string_literal: true

module Api
  module V1
    class SlidesController < ApplicationController
      def index
        @organization = Organization.find(params[:organization_id])
        @slides = @organization.slides.all
        render json: SlideSerializer.new(@slides).serializable_hash
      end
    end
  end
end
