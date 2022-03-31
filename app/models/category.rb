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
#  news_id      :bigint
#
# Indexes
#
#  index_categories_on_discarded_at  (discarded_at)
#  index_categories_on_news_id       (news_id)
#
# Foreign Keys
#
#  fk_rails_...  (news_id => news.id)
#
class Category < ApplicationRecord
  include Discard::Model

  has_one_attached :image

  belongs_to :news, optional: true

  validates :name, presence: true
end
