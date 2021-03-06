# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :text
#  discarded_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  news_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_comments_on_discarded_at  (discarded_at)
#  index_comments_on_news_id       (news_id)
#  index_comments_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (news_id => news.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user { "" }
    new { "" }
  end
end
