# frozen_string_literal: true

# == Schema Information
#
# Table name: news
#
#  id           :bigint           not null, primary key
#  content      :string           not null
#  discarded_at :datetime
#  name         :string           not null
#  news_type    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint
#
# Indexes
#
#  index_news_on_category_id   (category_id)
#  index_news_on_discarded_at  (discarded_at)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class NewsSerializer
  include JSONAPI::Serializer

  attributes :name, :content, :news_type, :comments
  attribute :image do |object|
    object.image.url if object.image.filename
  end

  has_many :comments
end
