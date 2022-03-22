# frozen_string_literal: true

FactoryBot.define do
  factory :slide do
    imageUrl { nil }
    text { 'MyText' }
    order { 1 }
  end
end
