# frozen_string_literal: true

class Users < ApplicationRecord
  include Discard::Model

  has_one_attached :photo
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
end
