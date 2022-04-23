# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id           :bigint           not null, primary key
#  description  :string
#  discarded_at :datetime
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_categories_on_discarded_at  (discarded_at)
#

class CategorySerializer
  include JSONAPI::Serializer

  attributes :name, :description

  attribute :image do |object|
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
  end

  has_many :news
end
