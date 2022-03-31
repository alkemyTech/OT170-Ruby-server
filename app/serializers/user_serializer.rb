# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email, :created_at, :updated_at
end
