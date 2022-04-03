# frozen_string_literal: true

# == Schema Information
#
# Table name: sessions
#
#  id           :bigint           not null, primary key
#  last_used_at :datetime         default(Sun, 03 Apr 2022 22:28:59.307056000 UTC +00:00)
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
class Session < ApplicationRecord
  belongs_to :user
  before_validation :generate_token, on: :create

  after_create :used

  validates :token, presence: true
  validates :user_id, presence: true

  def late?
    return false unless (last_used_at + 1.hour) >= Time.zone.now

    close
    true
  end

  def self.search(user_id, token)
    Session.find_by(user_id: user_id, token: token, status: true)
  end

  def used
    update(last_used_at: Time.zone.now)
  end

  def close
    update(status: false)
  end

  def generate_token
    self.token = loop do
      random_token = SecureRandom.base58(32)
      break random_token unless Session.exists?(token: random_token)
    end
  end
end
