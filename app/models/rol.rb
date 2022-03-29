# frozen_string_literal: true

class Rol < ApplicationRecord
  validates :name, presence: true
end
