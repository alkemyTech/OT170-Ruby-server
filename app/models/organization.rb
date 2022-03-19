# frozen_string_literal: true

class Organization < ApplicationRecord
  include Discard::Model

  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: 'Must be a valid email address' },
                    uniqueness: { case_sensitive: false }
  validates :welcome_text, presence: true
end
