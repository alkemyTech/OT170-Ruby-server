# frozen_string_literal: true

# == Schema Information
#
# Table name: testimonials
#
#  id           :bigint           not null, primary key
#  content      :text
#  discarded_at :datetime
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_testimonials_on_discarded_at  (discarded_at)
#
FactoryBot.define do
  factory :testimonial do
    name { Faker::Name.name }
    content { Faker::Lorem.paragraph }

    after(:build) do |testimonial|
      testimonial.image.attach(io: File.open('spec/fixtures/test_images.jpg'),
                               filename: 'test_images.jpg', content_type: 'image/jpg')
    end
  end
end
