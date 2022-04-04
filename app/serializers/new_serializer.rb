# frozen_string_literal: true

class NewSerializer
  include JSONAPI::Serializer
  attributes :image, :name, :content
end
