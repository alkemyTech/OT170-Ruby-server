# frozen_string_literal: true

# == Schema Information
#
# Table name: user_verifications
#
#  id          :bigint           not null, primary key
#  status      :string           default("pending")
#  token       :string
#  verify_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_user_verifications_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserVerification, type: :model do
  let(:user_verification) { build(:user_verification) }

  it 'has a valid factory' do
    user_verification.should be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user).required }
  end
end
