# frozen_string_literal: true

# == Schema Information
#
# Table name: slides
#
#  id              :bigint           not null, primary key
#  discarded_at    :datetime
#  order           :integer          not null
#  text            :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_slides_on_discarded_at     (discarded_at)
#  index_slides_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class SlideSerializer
  include JSONAPI::Serializer
  attributes :order, :organization_id
  attribute :image do |object|
    if object.image.filename
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    end
  end
end
