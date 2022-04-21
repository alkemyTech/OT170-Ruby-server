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
#  category_id  :bigint           not null
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
class News < ApplicationRecord
  include Discard::Model

  has_one_attached :image
  has_one :category, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :content, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
