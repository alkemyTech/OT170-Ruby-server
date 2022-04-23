# == Schema Information
#
# Table name: activities
#
#  id           :bigint           not null, primary key
#  content      :string           not null
#  discarded_at :datetime
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_activities_on_discarded_at  (discarded_at)
#
class ActivitySerializer
  include JSONAPI::Serializer

  attributes :name, :content

  attribute :image do |object|
    object.image.url if object.image.filename
  end
end
