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
    name { Faker::Name.name_with_middle }
    content { Faker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new('path', 'image/png') }
  end
end
