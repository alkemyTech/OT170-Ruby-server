# == Schema Information
#
# Table name: testimonials
#
#  id           :bigint           not null, primary key
#  content      :text
#  discarded_at :datetime
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_testimonials_on_discarded_at  (discarded_at)
#
class TestimonialSerializer
  include JSONAPI::Serializer
  attributes :name, :content
  attribute :image do |object|
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end
end
