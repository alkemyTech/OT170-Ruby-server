# frozen_string_literal: true

class ContactSerializer
  include JSONAPI::Serializer
  attributes :name, :phone, :email, :message
end
