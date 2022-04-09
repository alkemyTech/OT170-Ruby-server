# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApplicationController
      def create
        @contact = Contact.new(contact_params)
        if @contact.save
          render json: ContactSerializer.new(@contact).serializable_hash, status: :created
        else
          render json: @contact.errors, status: :unprocessable_entity
        end
      end

      private

      def contact_params
        params.require(:contact).permit(:name, :phone, :email, :message)
      end
    end
  end
end
