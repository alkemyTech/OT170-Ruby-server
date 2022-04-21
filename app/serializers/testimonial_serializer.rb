class TestimonialSerializer
  include JSONAPI::Serializer
  attributes :image, :name, :content
end
