# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    name { Faker::Name.name_with_middle }
    content { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new('path', 'image/png') }
  end
end
