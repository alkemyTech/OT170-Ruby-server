# frozen_string_literal: true

# == Schema Information
#
# Table name: news
#
#  id           :bigint           not null, primary key
#  content      :string           not null
#  discarded_at :datetime
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint           not null
#
# Indexes
#
#  index_news_on_category_id   (category_id)
#  index_news_on_discarded_at  (discarded_at)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
FactoryBot.define do
  factory :news do
    category
    name { Faker::Name.name_with_middle }
    content { Faker::Lorem.sentence }

    after(:build) do |news|
      news.image.attach(io: File.open('spec/fixtures/test_images.jpg'),
                        filename: 'test_images.jpg', content_type: 'image/jpg')
    end
  end
end
