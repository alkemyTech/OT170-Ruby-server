# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id           :bigint           not null, primary key
#  description  :string
#  discarded_at :datetime
#  facebookUrl  :string
#  instagramUrl :string
#  linkedinUrl  :string
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_members_on_discarded_at  (discarded_at)
#
FactoryBot.define do
  factory :member do
    name { Faker::Name.name }
    facebook_url { Faker::Internet.url }
    instagram_url { Faker::Internet.url }
    linkedin_url { Faker::Internet.url }
    description { Faker::Lorem.paragraph }

    after(:build) do |member|
      member.image.attach(io: File.open('spec/fixtures/test_images.jpg'),
                          filename: 'test_images.jpg', content_type: 'image/jpg')
    end
  end
end
