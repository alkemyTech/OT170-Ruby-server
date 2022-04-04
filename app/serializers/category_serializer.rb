<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> bc85b0d (feat/0T171-41-endpoint-detail-category)
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
<<<<<<< HEAD
  attributes :name, :description
=======

  attributes :image, :name, :description
>>>>>>> bc85b0d (feat/0T171-41-endpoint-detail-category)
end
