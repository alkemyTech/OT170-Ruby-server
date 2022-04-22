# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApplicationController
      before_action :set_contact

      def index
        @contact = Contact.all
        render json: ContactSerializer.new(@contact).serializable_hash
      end

      def create
        @contact = Contact.new(contact_params)
        if @contact.save
          render json: ContactSerializer.new(@contact).serializable_hash, status: :created
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      private

      def set_contact
        @contact = contact.find(params[:id])
      end

      def contact_params
        params.require(:contact).permit(:name, :phone, :email, :message)
      end

      def render_error
        render json: { errors: @contact.errors.full_messages }, status: :not_found
      end
    end
  end
end
