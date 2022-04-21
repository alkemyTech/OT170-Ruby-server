# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id            :bigint           not null, primary key
#  about_us_text :text
#  address       :string
#  discarded_at  :datetime
#  email         :string           not null
#  name          :string           not null
#  phone         :integer
#  welcome_text  :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_organizations_on_discarded_at  (discarded_at)
#  index_organizations_on_email         (email) UNIQUE
#
FactoryBot.define do
  factory :organization do
    name { Faker::Name.name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    welcome_text { Faker::Lorem.paragraph }
    about_us_text { Faker::Lorem.paragraph }

    after(:build) do |organization|
      organization.image.attach(io: File.open('spec/fixtures/test_images.jpg'),
                                filename: 'test_images.jpg', content_type: 'image/jpg')
    end
  end
end
