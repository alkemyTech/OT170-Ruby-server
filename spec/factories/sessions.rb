# frozen_string_literal: true

# == Schema Information
#
# Table name: sessions
#
#  id           :bigint           not null, primary key
#  last_used_at :datetime         default(Sun, 10 Apr 2022 23:16:38.337012000 UTC +00:00)
#  status       :boolean          default(TRUE)
#  token        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :session do
    user
    last_used_at { Time.zone.now }
    status { true }
    token { SecureRandom.base58(32) }
  end
end
