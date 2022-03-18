# frozen_string_literal: true

class Users < ApplicationRecord
  include Discard::Model

  has_one_attached :image

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: 'Must be a valid email address' },
                    uniqueness: { case_sensitive: false }
end
