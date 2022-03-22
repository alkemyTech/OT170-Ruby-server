# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :organization

  has_one_attached :image

  validates :text, presence: true
  validates :order, presence: true
end
