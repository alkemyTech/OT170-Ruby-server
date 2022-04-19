# frozen_string_literal: true

# == Schema Information
#
# Table name: sessions
#
#  id           :bigint           not null, primary key
#  last_used_at :datetime         default(Tue, 19 Apr 2022 21:22:27.807763000 UTC +00:00)
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
require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:user) { create(:user) }
  let(:session) { build(:session, user: user) }

  it 'has a valid factory' do
    session.should be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user).required }
  end
end
