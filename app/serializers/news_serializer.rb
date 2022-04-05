# frozen_string_literal: true

class NewsSerializer
  include JSONAPI::Serializer
  attributes :image, :name, :content, :news_type
end
