# frozen_string_literal: true

class News < ApplicationRecord
  include Discard::Model

  has_one_attached :image
  has_one :category, dependent: :destroy

  validates :name, presence: true
  validates :content, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
